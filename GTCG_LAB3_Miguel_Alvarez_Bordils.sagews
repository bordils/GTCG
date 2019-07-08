︠394e439f-1589-4dbe-b61f-f0b9adab20f5︠
#Assume, for simplicity, that the glasses are paraboloids of revolution.
#Choose the points in the glasses that you want to be in contact.
#Please, do not choose points in the top boundary of the glasses, and choose a different point in each glass.
#Consider at least two different methods to solve your problem.

#Miguel Alvarez Bordils


#DRAWING THROUGH CHANGE OF REFERENCE SYSTEM

#parametric equation
theta,h = var('theta','h')
copa    = vector([h*cos(theta),h*sin(theta),h^2])

#partial derivatives
dTheta = derivative(copa,theta)
dh = derivative(copa,h)

#Normal vector to the surface and associated trihedron
E3 = dTheta.cross_product(dh)
E1 = vector([-E3[1],E3[0],0])
E2 = E3.cross_product(E1)

E1 = E1/E1.norm()
E2 = E2/E2.norm()
E3 = E3/E3.norm()

#trihedron parameterized in point1
e11 = E1(theta=0,h=4)
e12 = E2(theta=0,h=4)
e13 = E3(theta=0,h=4)

#trihedron parameterized in point2
e21 = E1(theta=0,h=2)
e22 = E2(theta=0,h=2)
e23 = -E3(theta=0,h=2)

#first change of coordinate system
A = matrix([e11,e12,e13])
A = A.transpose()
Ainverse = A.inverse()

#second change of coordinate system
A2 = matrix([e21,e22,e23])
A2 = A2.transpose()
A2inverse = A2.inverse()

O1=copa(theta=0,h=4)
O2=copa(theta=0,h=2)

copa2 = Ainverse*(copa-O1)
copa3 = A2inverse*(copa-O2)

#fixing vertical orientation matrix
VM = matrix([vector([1,0,0]),vector([0,0,1]),vector([0,1,0])])

copa2 = VM*copa2
copa3 = VM*copa3

#drawing
Fig1 = parametric_plot3d(copa, (theta,0,2*pi),(h,0,5),color='blue',opacity=0.4)
Fig2 = parametric_plot3d(copa2,(theta,0,2*pi),(h,0,5),color='red',opacity=0.4)
Fig3 = parametric_plot3d(copa3,(theta,0,2*pi),(h,0,5),color='green',opacity=0.4)

show('change of reference system')
show(Fig2+Fig3)


#DRAWGIN USING FOLEY VAN DAME ANGLES

#parametric equation
u,v  = var('u','v')
vaso = vector([v*cos(u),v*sin(u),v^2])

P1=vaso(u=0.2,v=3)
P2=vaso(u=2,v=2.2)

#partial derivatives
du = derivative(vaso,u)
dv = derivative(vaso,v)

#Normal
N =du.cross_product(dv)
N1 = N(u=0.2,v=3)
N2 = N(u=2,v=2.2)

# Translation
TP1 = matrix([vector([1, 0, 0, -P1[0]]), vector([0, 1, 0, -P1[1]]), vector([0, 0, 1, -P1[2]]), vector([0, 0, 0, 1])])

TP2 = matrix([vector([1, 0, 0, -P2[0]]), vector([0, 1, 0, -P2[1]]), vector([0, 0, 1, -P2[2]]), vector([0, 0, 0, 1])])

# Foley & Van Dam Angles

B1 = sgn(N1[0])*acos(N1[1]/(sqrt(N1[0]^2 + N1[1]^2)))
B2 = sgn(N2[0])*acos(N2[1]/(sqrt(N2[0]^2 + N2[1]^2)))

G1 = acos(N1[2]/sqrt(N1[0]^2 + N1[1]^2 + N1[2]^2))
G2 = acos(N2[2]/sqrt(N2[0]^2 + N2[1]^2 + N2[2]^2))

RzB1 = matrix([vector([cos(B1), -sin(B1), 0, 0]), vector([sin(B1), cos(B1), 0, 0]), vector([ 0, 0, 1, 0]), vector([ 0, 0, 0, 1])])
RzB2 = matrix([vector([cos(B2), -sin(B2), 0, 0]), vector([sin(B2), cos(B2), 0, 0]), vector([ 0, 0, 1, 0]), vector([ 0, 0, 0, 1])])

RxG1 = matrix([vector([1, 0, 0, 0]), vector([0, cos(G1), -sin(G1), 0]), vector([0, sin(G1), cos(G1), 0]), vector([0, 0, 0, 1])])
RxG2 = matrix([vector([1, 0, 0, 0]), vector([0, cos(G2), -sin(G2), 0]), vector([0, sin(G2), cos(G2), 0]), vector([0, 0, 0, 1])])

#simmetry
Sxy = matrix([vector([1, 0,  0, 0]), vector([0, 1,  0, 0]), vector([0, 0, -1, 0]), vector([0, 0,  0, 1])])

vasoAug=vector([vaso[0],vaso[1],vaso[2],1])

vasoAug2 =       RxG1 * RzB1 * TP1 * vasoAug
vasoAug3 = Sxy * RxG2 * RzB2 * TP2 * vasoAug

VM = matrix([vector([1, 0, 0, 0]),vector([0, 0, -1, 0]), vector([0, 1, 0, 0]), vector([0, 0, 0, 1])]).transpose()

vasoAug2 = VM * vasoAug2
vasoAug3 = VM * vasoAug3

vaso = vector([vasoAug[0],vasoAug[1],vasoAug[2]])
vaso2 = vector([vasoAug2[0],vasoAug2[1],vasoAug2[2]])
vaso3 = vector([vasoAug3[0],vasoAug3[1],vasoAug3[2]])

Fig4 = parametric_plot3d(vaso,  (u, 0, 2*pi), (v, 0, 5), color='red', opacity=0.4)
Fig5 = parametric_plot3d(vaso2, (u, 0, 2*pi), (v, 0, 5), color='green', opacity=0.4)
Fig6 = parametric_plot3d(vaso3, (u, 0,2*pi), (v, 0, 5), color='blue', opacity=0.4)

show('affinities')
show(Fig5+Fig6)
︡de180bee-1d8d-4516-af41-fd5495dbdb04︡{"html":"<div align='center'>change of reference system</div>"}︡{"file":{"filename":"4ee0c8d7-91f3-4a34-9bbf-fae9bee808bd.sage3d","uuid":"4ee0c8d7-91f3-4a34-9bbf-fae9bee808bd"}}︡{"html":"<div align='center'>affinities</div>"}︡{"file":{"filename":"6cdf3196-eac0-45b8-a65a-09f30bb9efd1.sage3d","uuid":"6cdf3196-eac0-45b8-a65a-09f30bb9efd1"}}︡{"done":true}︡









