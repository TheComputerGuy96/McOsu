#ifdef GL_ES
precision mediump float;
#endif

uniform sampler2D tex;

varying vec2 tex_coord;
varying float vtx_alpha;

void main()
{
	vec4 color = texture2D(tex, tex_coord);
	color.a *= vtx_alpha;

#ifndef GL_ES
	gl_FragColor = color;
#endif
}
