#pragma header

uniform float pee; 

void main()
{
    vec2 uv = openfl_TextureCoordv;

    vec2 p = floor(uv / pee + 0.5) * pee;
    vec4 colP = flixel_texture2D(bitmap, p);

    float lum = pow(1.0 - dot(colP.rgb, vec3(1.0 / 3.0)), pee * 5.0);

    float qs = pee * lum;
    vec2 q = floor(uv / qs + 0.5) * qs;

    vec2 r = (p - q) * lum + uv;
    gl_FragColor = flixel_texture2D(bitmap, r);
}