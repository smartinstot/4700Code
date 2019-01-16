function [ output_args ] = AddParticleStream(num, x0, y0, PartAng, Type, Ep, Seper)
global AtomSpacing x y AtomType Vx Vy Mass0 Mass1 Mass2 nAtoms

Type = randi([0 2], num, 1);
Mass = zeros(num, 1);
Mass(Type == 0) = Mass0;
Mass(Type == 1) = Mass1;
Mass(Type == 2) = Mass2;

for p = 0:num - 1
    nAtoms = nAtoms + 1;
    x(nAtoms) = x0 * AtomSpacing - Seper * p * AtomSpacing * cos(PartAng);
    y(nAtoms) = y0 * AtomSpacing - Seper * p * AtomSpacing * sin(PartAng);
    AtomType(nAtoms) = Type(p+1);
end

V = sqrt(2 * Ep ./ Mass);

for p = 1:num
    Vx(nAtoms - num + p) = V(p) * cos(PartAng);
    Vy(nAtoms - num + p) = V(p) * sin(PartAng);
end

end
