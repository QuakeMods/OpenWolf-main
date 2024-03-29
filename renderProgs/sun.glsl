/*[Vertex]*/
attribute vec2 attr_TexCoord0;
attribute vec2 attr_TexCoord1;

attribute vec4 attr_Color;

attribute vec3 attr_Position;
attribute vec3 attr_Normal;
attribute vec4 attr_Tangent;


uniform vec4	u_Local1; // parallaxScale, haveSpecular, specularScale, materialType
uniform vec4	u_Local2; // ExtinctionCoefficient
uniform vec4	u_Local3; // RimScalar, MaterialThickness, subSpecPower, cubemapScale
uniform vec4	u_Local4; // haveNormalMap, isMetalic, hasRealSubsurfaceMap, sway
uniform vec4	u_Local5; // hasRealOverlayMap, overlaySway, blinnPhong, hasSteepMap
uniform vec4	u_Local6; // useSunLightSpecular
uniform vec4	u_Local9;

uniform vec3	u_ViewOrigin;

uniform mat4	u_ModelViewProjectionMatrix;
uniform mat4	u_ViewProjectionMatrix;
uniform mat4	u_ModelMatrix;
uniform mat4	u_NormalMatrix;

uniform vec2	u_textureScale;

varying vec2	var_TexCoords;

void main()
{
	vec3 position  = attr_Position;
	vec3 normal    = attr_Normal * 2.0 - 1.0;

	vec2 texCoords = attr_TexCoord0.st;
	var_TexCoords.xy = texCoords;

	if (!(u_textureScale.x == 0.0 && u_textureScale.y == 0.0) && !(u_textureScale.x == 1.0 && u_textureScale.y == 1.0))
	{
		var_TexCoords *= u_textureScale;
	}

	gl_Position = u_ModelViewProjectionMatrix * vec4(position, 1.0);
}

/*[Fragment]*/
uniform sampler2D u_DiffuseMap;

uniform vec2	u_Dimensions;
uniform vec4	u_Local1; // parallaxScale, haveSpecular, specularScale, materialType
uniform vec4	u_Local2; // ExtinctionCoefficient
uniform vec4	u_Local3; // RimScalar, MaterialThickness, subSpecPower, cubemapScale
uniform vec4	u_Local4; // haveNormalMap, isMetalic, hasRealSubsurfaceMap, sway
uniform vec4	u_Local5; // hasRealOverlayMap, overlaySway, blinnPhong, hasSteepMap
uniform vec4	u_Local6; // useSunLightSpecular, 0, 0, shadowPass
uniform vec4	u_Local9;

uniform float	u_Time;

varying vec2    var_TexCoords;


out vec4 out_Glow;


#define m_Normal		var_Normal
#define m_TexCoords		var_TexCoords
#define m_vertPos		var_vertPos
#define m_ViewDir		var_ViewDir


/*
const vec3 sunColor1 = vec3(1.0,1.0,0.0);
const vec3 sunColor2 = vec3(1.0,0.0,0.0);
const vec3 sunColor3 = vec3(1.0,0.0,1.0);
*/

const vec3 sunColor1 = vec3(1.0,0.7,0.0);
const vec3 sunColor2 = vec3(0.3,0.2,0.0);
const vec3 sunColor3 = vec3(0.2,0.1,1.0);

// animated noise
vec4 NC0=vec4(0.0,157.0,113.0,270.0);
vec4 NC1=vec4(1.0,158.0,114.0,271.0);
vec4 WS=vec4(0.25,0.25,0.25,0.25);

// mix noise for alive animation, full source
vec4 hash4( vec4 n ) { return fract(sin(n)*1399763.5453123); }
vec3 hash3( vec3 n ) { return fract(sin(n)*1399763.5453123); }
vec3 hpos( vec3 n ) { return hash3(vec3(dot(n,vec3(157.0,113.0,271.0)),dot(n,vec3(271.0,157.0,113.0)),dot(n,vec3(113.0,271.0,157.0)))); }

float noise4q(vec4 x)
{
	vec4 n3 = vec4(0,0.25,0.5,0.75);
	vec4 p2 = floor(x.wwww+n3);
	vec4 b = floor(x.xxxx+n3) + floor(x.yyyy+n3)*157.0 + floor(x.zzzz +n3)*113.0;
	vec4 p1 = b + fract(p2*0.00390625)*vec4(164352.0, -164352.0, 163840.0, -163840.0);
	p2 = b + fract((p2+1.0)*0.00390625)*vec4(164352.0, -164352.0, 163840.0, -163840.0);
	vec4 f1 = fract(x.xxxx+n3);
	vec4 f2 = fract(x.yyyy+n3);
	f1=f1*f1*(3.0-2.0*f1);
	f2=f2*f2*(3.0-2.0*f2);
	vec4 n1 = vec4(0,1.0,157.0,158.0);
	vec4 n2 = vec4(113.0,114.0,270.0,271.0);	
	vec4 vs1 = mix(hash4(p1), hash4(n1.yyyy+p1), f1);
	vec4 vs2 = mix(hash4(n1.zzzz+p1), hash4(n1.wwww+p1), f1);
	vec4 vs3 = mix(hash4(p2), hash4(n1.yyyy+p2), f1);
	vec4 vs4 = mix(hash4(n1.zzzz+p2), hash4(n1.wwww+p2), f1);	
	vs1 = mix(vs1, vs2, f2);
	vs3 = mix(vs3, vs4, f2);
	vs2 = mix(hash4(n2.xxxx+p1), hash4(n2.yyyy+p1), f1);
	vs4 = mix(hash4(n2.zzzz+p1), hash4(n2.wwww+p1), f1);
	vs2 = mix(vs2, vs4, f2);
	vs4 = mix(hash4(n2.xxxx+p2), hash4(n2.yyyy+p2), f1);
	vec4 vs5 = mix(hash4(n2.zzzz+p2), hash4(n2.wwww+p2), f1);
	vs4 = mix(vs4, vs5, f2);
	f1 = fract(x.zzzz+n3);
	f2 = fract(x.wwww+n3);
	f1=f1*f1*(3.0-2.0*f1);
	f2=f2*f2*(3.0-2.0*f2);
	vs1 = mix(vs1, vs2, f1);
	vs3 = mix(vs3, vs4, f1);
	vs1 = mix(vs1, vs3, f2);
	float r=dot(vs1,vec4(0.25));
	//r=r*r*(3.0-2.0*r);
	return r*r*(3.0-2.0*r);
}

// body of a star
float noiseSpere(vec3 ray,vec3 pos,float r,mat3 mr,float zoom,vec3 subnoise,float anim)
{
  	float b = dot(ray,pos);
  	float c = dot(pos,pos) - b*b;
    
    vec3 r1=vec3(0.0);
    
    float s=0.0;
    float d=0.03125;
    float d2=zoom/(d*d); 
    float ar=5.0;
   
    for (int i=0;i<3;i++) {
		float rq=r*r;
        if(c <rq)
        {
            float l1=sqrt(rq-c);
            r1= ray*(b-l1)-pos;
            r1=r1*mr;
            s+=abs(noise4q(vec4(r1*d2+subnoise*ar,anim*ar))*d);
        }
        ar-=2.0;
        d*=4.0;
        d2*=0.0625;
        r=r-r*0.02;
    }
    return s;
}

// glow ring
float ring(vec3 ray,vec3 pos,float r,float size)
{
  	float b = dot(ray,pos);
  	float c = dot(pos,pos) - b*b;
   
    float s=max(0.0,(1.0-size*abs(r-sqrt(c))));
    
    return s;
}

// rays of a star
float ringRayNoise(vec3 ray,vec3 pos,float r,float size,mat3 mr,float anim)
{
  	float b = dot(ray,pos);
    vec3 pr=ray*b-pos;
       
    float c=length(pr);

    pr*=mr;
    
    pr=normalize(pr);
    
    float s=max(0.0,(1.0-size*abs(r-c)));
    
    float nd=noise4q(vec4(pr*1.0,-anim+c))*2.0;
    nd=pow(nd,2.0);
    float n=0.4;
    float ns=1.0;
    if (c>r) {
        n=noise4q(vec4(pr*10.0,-anim+c));
        ns=noise4q(vec4(pr*50.0,-anim*2.5+c*2.0))*2.0;
    }
    n=n*n*nd*ns;
    
    return pow(s,4.0)+s*s*n;
}

vec4 noiseSpace(vec3 ray,vec3 pos,float r,mat3 mr,float zoom,vec3 subnoise,float anim)
{
  	float b = dot(ray,pos);
  	float c = dot(pos,pos) - b*b;
    
    vec3 r1=vec3(0.0);
    
    float s=0.0;
    float d=0.0625*1.5;
    float d2=zoom/d;

	float rq=r*r;
    float l1=sqrt(abs(rq-c));
    r1= (ray*(b-l1)-pos)*mr;

    r1*=d2;
    s+=abs(noise4q(vec4(r1+subnoise,anim))*d);
    s+=abs(noise4q(vec4(r1*0.5+subnoise,anim))*d*2.0);
    s+=abs(noise4q(vec4(r1*0.25+subnoise,anim))*d*4.0);
    //return s;
    return vec4(s*2.0,abs(noise4q(vec4(r1*0.1+subnoise,anim))),abs(noise4q(vec4(r1*0.1+subnoise*6.0,anim))),abs(noise4q(vec4(r1*0.1+subnoise*13.0,anim))));
}

float sphereZero(vec3 ray,vec3 pos,float r)
{
  	float b = dot(ray,pos);
  	float c = dot(pos,pos) - b*b;
    float s=1.0;
    if (c<r*r) s=0.0;
    return s;
}

void getSun( out vec4 fragColor, in vec2 fragCoord )
{
	vec2 p = (-u_Dimensions.xy + 2.0*fragCoord.xy) / u_Dimensions.y;
	p *= 2.0; // Sun scale (larger is smaller sun)

    float time=u_Time;
    
	float mx = time*0.025;
    float my = -0.6;
    vec2 rotate = vec2(mx,my);

    vec2 sins=sin(rotate);
    vec2 coss=cos(rotate);
    mat3 mr=mat3(vec3(coss.x,0.0,sins.x),vec3(0.0,1.0,0.0),vec3(-sins.x,0.0,coss.x));
    mr=mat3(vec3(1.0,0.0,0.0),vec3(0.0,coss.y,sins.y),vec3(0.0,-sins.y,coss.y))*mr;    

    mat3 imr=mat3(vec3(coss.x,0.0,-sins.x),vec3(0.0,1.0,0.0),vec3(sins.x,0.0,coss.x));
    imr=imr*mat3(vec3(1.0,0.0,0.0),vec3(0.0,coss.y,-sins.y),vec3(0.0,sins.y,coss.y));
	
    vec3 ray = normalize(vec3(p,2.0));
    vec3 pos = vec3(0.0,0.0,3.0);
    
    float s1=noiseSpere(ray,pos,1.0,mr,0.5,vec3(0.0),time);
    s1=pow(min(1.0,s1*2.4),2.0);
	s1 *= 0.25;//u_Local9.r;

    float s2=noiseSpere(ray,pos,1.0,mr,4.0,vec3(83.23,34.34,67.453),time);
    s2=min(1.0,s2*2.2);
	s2 *= 0.7;//u_Local9.g;

    fragColor = vec4( mix(sunColor1,vec3(1.0),pow(s1,60.0))*s1, 1.0 );
    fragColor += vec4( mix(mix(sunColor2,sunColor3,pow(s2,2.0)),vec3(1.0),pow(s2,10.0))*s2, 1.0 );
	
    fragColor.xyz -= vec3(ring(ray,pos,1.03,11.0))*2.0;
    fragColor = max( vec4(0.0), fragColor );
    
    //float s3=ringRayNoise(ray,pos,0.96,1.0,mr,time);
	//s3 *= u_Local9.b;
    //fragColor.xyz += mix(vec3(1.0,0.6,0.1),vec3(1.0,0.95,1.0),pow(s3,3.0))*s3;

    float zero=sphereZero(ray,pos,0.9);

    if (zero>0.0) 
	{
	    //vec4 s4=noiseSpace(ray,pos,100.0,mr,0.05,vec3(1.0,2.0,4.0),0.0);
    	//s4.x=pow(s4.x,3.0);
		vec4 s4=vec4(0.0);
    	fragColor.xyz += mix(mix(vec3(1.0,0.0,0.0),vec3(0.0,0.0,1.0),s4.y*1.9),vec3(0.9,1.0,0.1),s4.w*0.75)*s4.x*pow(s4.z*2.5,3.0)*0.2*zero;
    }
    
    fragColor = max( vec4(0.0), fragColor );
	fragColor = min( vec4(1.0), fragColor );
}

void main()
{
	vec2 texCoords = m_TexCoords.xy * u_Dimensions.xy;
	getSun( gl_FragColor, texCoords );
	gl_FragColor.rgb *= 2.0;//u_Local9.a;
	out_Glow = gl_FragColor;
}
