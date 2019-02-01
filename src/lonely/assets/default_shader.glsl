//Default Shader for LONELY
//By Luuk van Oijen
//It's all open source
//This code will use a lot of Inigo Quilez's work: https://www.iquilezles.org/ This man is a hero x)

struct Ray {
  vec3 position;
  vec3 direction;
  vec3 color;
};

struct Camera {
  vec3 position;
  vec3 direction;
  float roll;
  float FoV;
};

uniform Camera camera;

///setCamera is a function to get the camera's rotation matrix. I cannot possibly
///remember where i got this from, but it works beautifully. Probably IQ on
///shadertoy, but will have to check later
///Arguments:
//ro is the ray's origin.
//ta is the ray's direction.
//cr is the ray's rotation around the camera's direction (roll).
mat3 setCamera( in vec3 ro, in vec3 ta, float cr )
{
	vec3 cw = normalize(ta-ro);
	vec3 cp = vec3(sin(cr), cos(cr),0.0);
	vec3 cu = normalize( cross(cw,cp) );
	vec3 cv = normalize( cross(cu,cw) );
    return mat3( cu, cv, cw );
}

vec4 effect(vec4 color, sampler2D texture, vec2 tex_coords, vec2 scr_coords)
{
  vec4 col = vec4(1.0, 0.0, 0.0, 1.0);
  return col;
}
