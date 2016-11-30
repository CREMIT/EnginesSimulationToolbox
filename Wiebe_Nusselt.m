%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Modelo de maquina termica MACI
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%PROPIEDADES

%Fluido motor aire
R  = 8.31 %[J/mol k]
disp('[J/mol k]')
Cp = 28.14 %[J/mol k]
Cv = Cp - R %[J/mol k]
M  = 28.9 %[grs/mol]
M  = M/1000; %[kg/mol]
k  = Cp/Cv %[]

%Geometria cilindro
Vcu = 400 %[cm3]
Vcu = Vcu / 1000000; %[m3]
Vcc = 40 %[cm3]
Vcc = Vcc / 1000000; %[m3]
rel = (Vcc + Vcu) / Vcc %[]
D = 10 %[cm]
D = D / 100; %[m]
CA = Vcu / (pi*D^2/4) %[m2]
S = pi*D^2/4 %[m2]
RPM = 5000 %[RPM]
RPM = RPM/60*2*pi; %[rad/s]
l = 1.8 * CA %[m]
r = CA / 2 %[m]
lambda = r / l %[]
%Propiedades combustible
dos = 14.7 %[]
PCI = 42 %[MJ/kg]
PCI = PCI * 1000000; %[J/kg]

%Variable dinamica
alphamin = 0 %[rad]
alphamax = 2*pi %[rad]
N = 1000 %[]
alpha = linspace(alphamin, alphamax, N); %[rad]
alpha_grad = alpha*180/pi;

%Distribucion
ini_comp = 0 %[º]
ini_comp = ini_comp/180*pi; %[rad]
ini_exp = 180 %[º]
ini_exp = ini_exp/180*pi; %[rad]

%Cinematica
x = r * (1 - cos(alpha)) + l * (1 - sqrt(1 - lambda^2*sin(alpha).^2));
v = r * (sin(alpha) + lambda * sin(alpha).*cos(alpha) / sqrt(1 - lambda^2*sin(alpha).^2)) * RPM;
a = RPM^2 * r * (cos(alpha) + lambda * cos(2*alpha));
V = Vcc + (CA - x) * S; %[m^3]

%Plot cinematica
figure
plot(alpha_grad,x)
xlabel('\alpha [º]')
ylabel('Distancia [m]')
grid on
set(gcf,'Color',[1 1 1]);

figure
plot(alpha_grad,v)
xlabel('\alpha [º]')
ylabel('Velocidad [m/s]')
grid on
set(gcf,'Color',[1 1 1]);

figure
plot(alpha_grad,a)
xlabel('\alpha [º]')
ylabel('Aceleracion [m/s^2]')
grid on
set(gcf,'Color',[1 1 1]);

figure
plot(alpha_grad,V*1000000)
xlabel('\alpha [º]')
ylabel('Volumen [cm^3]')
grid on
set(gcf,'Color',[1 1 1]);

%Termodinamica


%Loop principal
for i=1:N,


end

