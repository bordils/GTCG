︠7c8ad43a-e9b0-452c-9fda-e123d212cf72s︠



#######################     asignación vertices y vectores

OA=vector([1,1,1])
OB=vector([1,-1,1])
OC=vector([-1,-1,1])
OD=vector([-1,1,1])
OE=vector([1,1,-1])
OF=vector([1,-1,-1])
OG=vector([-1,-1,-1])
OH=vector([-1,1,-1])

########################      puntos secantes del cubo truncado
OP=0.5*(OA+OB) #Y=0
OQ=0.5*(OA+OD) #X=0
OR=0.5*(OA+OE) #Z=0

########################      definicion de las caras
cara1=polygon([OB,OC,OD,OQ,OP],color='red',opacity=0.3)
cara2=polygon([OF,OE,OR,OP,OB],color='green',opacity=0.3)
cara3=polygon([OD,OH,OE,OR,OQ],color='blue',opacity=0.3)
cara4=polygon([OC,OD,OH,OG],color='green',opacity=0.3)
cara5=polygon([OB,OC,OG,OF],color='blue',opacity=0.3)
cara6=polygon([OE,OF,OG,OH],color='red',opacity=0.3)
cara7=polygon([OP,OQ,OR],color='yellow',opacity=0.3)


########################      definicion del cubo truncado
C1=(cara1+cara2+cara3+cara4+cara5+cara6+cara7)
show(C1) #resultado pregunta 1.1
#########################################################################################################
#########################################################################################################
#########################################################################################################

#vector S1 vertical
S1=vector([0,0,1])

#definir centro
centro=(OP+OQ+OR)/3


start=vector([0,0,0])
end=vector([0,0,0])+S1
S1_1=line([start,end]) #vector S1

#vector e1 del plano truncado S2
e1=OP-OQ
e1=e1/e1.norm()

#vector e2 del plano truncado
e2=OP-OR
e2=-e2/e2.norm()

#vector normal al plano truncado
normal=e1.cross_product(e2)
normal_u=normal/normal.norm()

e2=normal_u.cross_product(e1)
e2=e2/e2.norm()

# E1 = line([centro,centro+e1])
# E2 = line([centro,centro+e2])
# E3 = line([centro,centro+normal_u])
# 
# show(E1+E2+E3+C1)

#dibujar S2
start=centro
end=centro+normal_u
S2=line([start,end])
show(C1+S2+S1_1)

#dibujar S2 con cambio de base
matriz=matrix([e1,e2,normal_u])
matriz=matriz.transpose()

S2_2vec=(matriz*S1+centro)
S2_2=line([centro, S2_2vec])
show(C1+S2_2) #resultado pregunta 1.2

#########################################################################################################
#########################################################################################################
#########################################################################################################

#dibujar S3
S3=line([centro,centro+e1])
show(C1+S3)



S3_3vec=(matriz*vector([1,0,0])+centro)
S3_3=line([centro, S3_3vec])
show(C1+S3_3) #resultado del a pregunta 1.3

#########################################################################################################
#########################################################################################################
#########################################################################################################

matriz=matrix([e1,e2,-normal_u])
matriz=matriz.transpose()
matrizinv = matriz.inverse()


OA2 = matrizinv * OA + centro
OB2 = matrizinv * OB + centro
OC2 = matrizinv * OC + centro
OD2 = matrizinv * OD + centro
OE2 = matrizinv * OE + centro
OF2 = matrizinv * OF + centro
OG2 = matrizinv * OG + centro
OH2 = matrizinv * OH + centro
OP2 = matrizinv * OP + centro
OQ2 = matrizinv * OQ + centro
OR2 = matrizinv * OR + centro

cara12 = polygon([OB2, OC2, OD2, OP2, OQ2],color='red',opacity=0.3)
cara22 = polygon([OF2, OE2, OR2, OP2, OB2],color='green',opacity=0.3)
cara32 = polygon([OD2, OE2, OR2, OQ2, OH2],color='blue',opacity=0.3)
cara42 = polygon([OC2, OD2, OG2, OH2],color='green',opacity=0.3)
cara52 = polygon([OB2, OC2, OF2, OG2],color='blue',opacity=0.3)
cara62 = polygon([OE2, OF2, OG2, OH2],color='red',opacity=0.3)
cara72 = polygon([OP2, OQ2, OR2],color='yellow',opacity=0.3)
C2= (cara12 +cara22 +cara32 +cara42 +cara52 +cara62 +cara72)

show(C2) #resultado 1.4

#########################################################################################################
#########################################################################################################
#########################################################################################################

a1 = vector ([1,0,0]) - centro
a1 = a1 / a1.norm()
a2 = vector ([0,1,0]) - centro
a2 = a2 / a2.norm()
a3 = vector ([0,0,1]) - centro
a3 = a3 / a3.norm()

matriz2 = matrix([a1, a2, a3])
matriz2 = matriz2.transpose()
matriz2 = matriz2.inverse()

centro += centro

OA3 = matriz2 * OA + centro
OB3 = matriz2 * OB + centro
OC3 = matriz2 * OC + centro
OD3 = matriz2 * OD + centro
OE3 = matriz2 * OE + centro
OF3 = matriz2 * OF + centro
OG3 = matriz2 * OG + centro
OH3 = matriz2 * OH + centro
OP3 = matriz2 * OP + centro
OQ3 = matriz2 * OQ + centro
OR3 = matriz2 * OR + centro

cara13 = polygon ([OB3, OC3, OD3, OP3, OQ3], color='red', opacity=0.3)
cara23 = polygon ([OF3, OE3, OR3, OP3, OB3], color='green', opacity=0.3)
cara33 = polygon ([OD3, OE3, OR3, OQ3, OH3], color='blue', opacity=0.3)
cara43 = polygon ([OC3, OD3, OG3, OH3], color='green', opacity=0.3)
cara53 = polygon ([OB3, OC3, OF3, OG3], color='blue', opacity=0.3)
cara63 = polygon ([OE3, OF3, OG3, OH3], color='red', opacity=0.3)
cara73 = polygon ([OP3, OQ3, OR3], color='yellow', opacity=0.3)
C3=(cara13 + cara23 + cara33 + cara43 + cara53 + cara63 + cara73)

show(C1+C3) #resultado 1.5
︡587b85cb-ba93-4e25-a565-aa6127f2376d︡{"file":{"filename":"355fc93b-7b89-4ae6-84f6-8e3ea5000bb3.sage3d","uuid":"355fc93b-7b89-4ae6-84f6-8e3ea5000bb3"}}︡{"file":{"filename":"78e924a3-d448-4437-b0a8-a1b08d69af5b.sage3d","uuid":"78e924a3-d448-4437-b0a8-a1b08d69af5b"}}︡{"file":{"filename":"b2122f91-c675-4486-b0dd-dc7eb1fce7a1.sage3d","uuid":"b2122f91-c675-4486-b0dd-dc7eb1fce7a1"}}︡{"file":{"filename":"1113fe9c-c895-48c2-b7b4-c60dfc435ccb.sage3d","uuid":"1113fe9c-c895-48c2-b7b4-c60dfc435ccb"}}︡{"file":{"filename":"1113fe9c-c895-48c2-b7b4-c60dfc435ccb.sage3d","uuid":"1113fe9c-c895-48c2-b7b4-c60dfc435ccb"}}︡{"file":{"filename":"2d3612f8-f3e4-4164-b52f-e28b3c9c062c.sage3d","uuid":"2d3612f8-f3e4-4164-b52f-e28b3c9c062c"}}︡{"file":{"filename":"fd8e8bb3-1fe1-465d-96ab-512cf61fe4a3.sage3d","uuid":"fd8e8bb3-1fe1-465d-96ab-512cf61fe4a3"}}︡{"done":true}︡









