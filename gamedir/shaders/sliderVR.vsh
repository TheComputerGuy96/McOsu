#ifdef GL_ES
attribute vec3 position;
attribute vec2 uv;
#endif

uniform mat4 matrix;
uniform mat4 mv;
varying vec2 tex_coord;

void main()
{
#ifdef GL_ES
	tex_coord = uv;
	vec4 vertex = vec4(position, 1.0);
	gl_Position = matrix * mv * vertex;
#else
	tex_coord = gl_MultiTexCoord0.xy;
	vec4 vertex = gl_Vertex;
	gl_Position = matrix * gl_ModelViewMatrix * vertex;
	gl_FrontColor = gl_Color;
#endif
}
