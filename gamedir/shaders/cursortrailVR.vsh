#ifdef GL_ES
attribute vec3 position;
attribute vec2 uv;
#endif

uniform mat4 matrix;
uniform mat4 mv;

varying vec2 tex_coord;
varying float vtx_alpha;

void main()
{
#ifdef GL_ES
	gl_Position = matrix * mv * vec4(position, 1.0);

	tex_coord = uv;
	vtx_alpha = position.z;
#else
	gl_Position = matrix * mv * vec4(gl_Vertex.x, gl_Vertex.y, 0.0, 1.0);

	tex_coord = gl_MultiTexCoord0.xy;
	vtx_alpha = gl_Vertex.z;
#endif
}
