#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;

uniform float LAYERS;
uniform float DEPTH;
uniform float WIDTH;
uniform float SPEED;

void mainImage(out vec4 O, vec2 U)
{
    float brightness = 0.0;

    const mat3 p = mat3(
        13.323122, 23.5112, 21.71123,
        21.1212,   28.7312, 11.9312,
        21.8112,   14.7212, 61.3934
    );

    U = iResolution.xy + U / iResolution.x;
    
    float dof = 5.0 * sin(iTime * 0.1);
    
    for (float i = 0.0; i < LAYERS; i++)
    {
        vec2 q = U * (1.0 + i * DEPTH);
        q += vec2(
            q.y * WIDTH * (fract(i * 7.238917) - 0.5),
            SPEED * iTime / (1.0 + i * DEPTH * 0.03)
        );

        vec3 n = vec3(floor(q), 31.189 + i);
        vec3 m = floor(n) / 1e5 + fract(n);
        vec3 mp = (31415.9 + m) / fract(p * m);
        vec3 r = fract(mp);

        vec2 s = abs(fract(q) - 0.5 + 0.9 * r.xy - 0.45)
                 + 0.01 * abs(2.0 * fract(10.0 * q.yx) - 1.0);
        float d = 0.6 * (s.x + s.y) + max(s.x, s.y) - 0.01;
        float edge = 0.005 + 0.05 * min(0.5 * abs(i - 5.0 - dof), 1.0);

        float flake = smoothstep(edge, -edge, d) * r.x / (1.0 + 0.02 * i * DEPTH);

        brightness += flake;
    }

    vec3 snowColor = vec3(1.0);
    O = vec4(snowColor * brightness, brightness);
}


void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}