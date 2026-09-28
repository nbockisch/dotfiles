#version 300 es
// NOTE: #version must be the literal first line — in the ES profile it may not
// be preceded even by comments.
//
// Modified version of https://github.com/wessles/GLSL-CRT/blob/master/shader.frag
//
// Hyprland screen shader: barrel distortion + scanlines, applied to the whole
// composited output.
//
// Must be GLSL ES 3.00. Hyprland links this against tex300.vert (#version 300
// es); a version-less shader defaults to ESSL 1.00 and the link fails with
// "all shaders must use the same shading language version". Hence `in` rather
// than `varying`, an explicit `out` rather than gl_FragColor, and texture()
// rather than texture2D().

precision mediump float;

in vec2 v_texcoord;
out vec4 fragColor;

uniform sampler2D tex;

void main() {
    vec2 tc = vec2(v_texcoord.x, v_texcoord.y);

    // Distance from the center
    float dx = abs(0.5-tc.x);
    float dy = abs(0.5-tc.y);

    // Square it to smooth the edges
    dx *= dx;
    dy *= dy;

    tc.x -= 0.5;
    tc.x *= 1.0 + (dy * 0.03);
    tc.x += 0.5;

    tc.y -= 0.5;
    tc.y *= 1.0 + (dx * 0.03);
    tc.y += 0.5;

    // Get texel, and add in scanline if need be
    vec4 cta = texture(tex, vec2(tc.x, tc.y));

    cta.rgb += sin(tc.y * 1250.0) * 0.02;

    // Cutoff
    if(tc.y > 1.0 || tc.x < 0.0 || tc.x > 1.0 || tc.y < 0.0)
        cta = vec4(0.0);

    // Apply
    fragColor = cta;
}
