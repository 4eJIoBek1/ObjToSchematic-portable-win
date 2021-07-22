uniform mat4 u_worldViewProjection;

attribute vec4 position;
attribute vec3 normal;
attribute vec4 occlusion;
attribute vec2 texcoord;

varying vec4 v_colour;
varying vec4 v_occlusion;
varying vec2 v_texcoord;

vec3 light = vec3(0.78, 0.98, 0.59);


void main() {
    v_texcoord = texcoord;
    v_occlusion = occlusion;
    //float lighting = dot(light, abs(normal)) * (1.0 - occlusion * 0.2);
    //float lighting = 0.2 * occlusion;
    //v_colour = vec4(abs(normal), 1.0);
    v_colour = vec4(vec3(dot(light, abs(normal))), 1.0);
    gl_Position = u_worldViewProjection * vec4(position.xyz, 1.0);
}