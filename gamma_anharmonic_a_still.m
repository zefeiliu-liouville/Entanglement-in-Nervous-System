clear

%% physcial constants
hbar = 1.0545726e-34;
epsilon_0 = 8.854187817e-12;
c = 299792458;%speed of light
q = 1.6021766208e-19;%electric charge
mass = 1.56e-27;%mass of Hydrogen atom
%ratio = 0.6;%a/b=ratio
%% molecule properties
omega_10 = 4.9198e14;%0.32427eV
omega_21 = 4.6868e14;%0.30891eV
N = (3 * omega_21 - omega_10)/(2 * (omega_10 - omega_21));
d_10 = 2/(2 * N -1) * sqrt((N-1)/2);d_10 = d_10 * 1e-10;
d_21 = 2/(2 * N -3) * sqrt(2*(N-1)*(N-2)/(2*N-1));d_21 = d_21 * 1e-10;%unit in bond length

Gamma0_10 = q^2 * d_10 ^2 * omega_10 ^3 /(3 *pi * hbar * epsilon_0 * c^3);
Gamma0_21 = q^2 * d_21 ^2 * omega_21 ^3 /(3 *pi * hbar * epsilon_0 * c^3);%transition rates in free space
%%
chi_011 = fzero(@(x)besselj(0,x),2);%2.40
alpha_011 = besselj(1,chi_011)^2;
chi_111 = fzero(@(x)besselj(1,x),4);%3.83
alpha_111 = besselj(2,chi_111)^2;
chi_211 = fzero(@(x)besselj(2,x),5);%5.14
alpha_211 = besselj(3,chi_211)^2;
chi_021 = fzero(@(x)besselj(0,x),5);%5.52
alpha_021 = besselj(1,chi_021)^2;
chi_311 = fzero(@(x)besselj(3,x),5);%6.38
alpha_311 = besselj(4,chi_311)^2;
chi_121 = fzero(@(x)besselj(1,x),7);%7.02
alpha_121 = besselj(2,chi_121)^2;
chi_411 = fzero(@(x)besselj(4,x),6);%7.59
alpha_411 = besselj(5,chi_411)^2;
chi_221 = fzero(@(x)besselj(2,x),8);%8.42
alpha_221 = besselj(3,chi_221)^2;
chi_031 = fzero(@(x)besselj(0,x),9);%8.65
alpha_031 = besselj(1,chi_031)^2;
chi_511 = fzero(@(x)besselj(5,x),8);%8.77
alpha_511 = besselj(6,chi_511)^2;
chi_321 = fzero(@(x)besselj(3,x),9);%9.76
alpha_321 = besselj(4,chi_321)^2;
chi_611 = fzero(@(x)besselj(6,x),10);%9.94
alpha_611 = besselj(7,chi_611)^2;
chi_131 = fzero(@(x)besselj(1,x),10);%10.17
alpha_131 = besselj(2,chi_131)^2;
chi_421 = fzero(@(x)besselj(4,x),11);%11.06
alpha_421 = besselj(5,chi_421)^2;
chi_711 = fzero(@(x)besselj(7,x),12);%11.09
alpha_711 = besselj(8,chi_711)^2;
chi_231 = fzero(@(x)besselj(2,x),11);%11.62
alpha_231 = besselj(3,chi_231)^2;
chi_041 = fzero(@(x)besselj(0,x),12);%11.79
alpha_041 = besselj(1,chi_041)^2;
chi_811 = fzero(@(x)besselj(8,x),12);%12.22
alpha_811 = besselj(9,chi_811)^2;
chi_521 = fzero(@(x)besselj(5,x),13);%12.34
alpha_521 = besselj(6,chi_521)^2;
chi_331 = fzero(@(x)besselj(3,x),13);%13.02
alpha_331 = besselj(4,chi_331)^2;
chi_141 = fzero(@(x)besselj(1,x),13);%13.32
alpha_141 = besselj(2,chi_141)^2;
chi_911 = fzero(@(x)besselj(9,x),14);%13.36
alpha_911 = besselj(10,chi_911)^2;
chi_621 = fzero(@(x)besselj(6,x),13);%13.59
alpha_621 = besselj(7,chi_621)^2;
chi_431 = fzero(@(x)besselj(4,x),14);%14.37
alpha_431 = besselj(5,chi_431)^2;
chi_1011 = fzero(@(x)besselj(10,x),14);%14.47
alpha_1011 = besselj(11,chi_1011)^2;
chi_241 = fzero(@(x)besselj(2,x),15);%14.80
alpha_241 = besselj(3,chi_241)^2;
chi_721 = fzero(@(x)besselj(7,x),14);%14.82
alpha_721 = besselj(8,chi_721)^2;
chi_051 = fzero(@(x)besselj(0,x),16);%14.93
alpha_051 = besselj(1,chi_051)^2;
chi_1111 = fzero(@(x)besselj(11,x),15);%15.58
alpha_1111 = besselj(12,chi_1111)^2;
chi_531 = fzero(@(x)besselj(5,x),15);%15.70
alpha_531 = besselj(6,chi_531)^2;
chi_821 = fzero(@(x)besselj(8,x),16);%16.03
alpha_821 = besselj(9,chi_821)^2;
chi_341 = fzero(@(x)besselj(3,x),16);%16.22
alpha_341 = besselj(4,chi_341)^2;
chi_151 = fzero(@(x)besselj(1,x),16);%16.47
alpha_151 = besselj(2,chi_151)^2;
chi_1211 = fzero(@(x)besselj(12,x),16);%16.69
alpha_1211 = besselj(13,chi_1211)^2;
%% initial
Gamma_21 = zeros(1,size(1.0e-6:0.001e-6:4.0e-6,2));Gamma_10 = zeros(1,size(1.0e-6:0.001e-6:4.0e-6,2));avg_of_cossquare = 1/2;
%%
a = 2e-6;
% for countd = 1:3001%width of myeline sheath
    countd = 450;
    d_my = (countd - 1) * 0.001e-6;
    b = a + d_my;

    syms x;
    for n = 0:1:12
        eval(['fun',num2str(n),'1 = @(x)besselj(',num2str(n),',x * chi_',num2str(n),'11/b).^2;']);
        eval(['avg_of_f_',num2str(n),'1 = integral(fun',num2str(n),'1,a,b)/d_my;']);
    end
    for n = 0:1:8
        eval(['fun',num2str(n),'2 = @(x)besselj(',num2str(n),',x * chi_',num2str(n),'21/b).^2;']);
        eval(['avg_of_f_',num2str(n),'2 = integral(fun',num2str(n),'2,a,b)/d_my;']);
    end
    for n = 0:1:5
        eval(['fun',num2str(n),'3 = @(x)besselj(',num2str(n),',x * chi_',num2str(n),'31/b).^2;']);
        eval(['avg_of_f_',num2str(n),'3 = integral(fun',num2str(n),'3,a,b)/d_my;']);
    end
    for n = 0:1:3
        eval(['fun',num2str(n),'4 = @(x)besselj(',num2str(n),',x * chi_',num2str(n),'41/b).^2;']);
        eval(['avg_of_f_',num2str(n),'4 = integral(fun',num2str(n),'4,a,b)/d_my;']);
    end
    for n = 0:1:1
        eval(['fun',num2str(n),'5 = @(x)besselj(',num2str(n),',x * chi_',num2str(n),'51/b).^2;']);
        eval(['avg_of_f_',num2str(n),'5 = integral(fun',num2str(n),'5,a,b)/d_my;']);
    end

    ksi_10 = omega_10  * b  / c;
    ksi_21 = omega_21  * b  / c;

    Gamma_21(countd) = 0;
    Gamma_10(countd) = 0;

    for n = 0:1:12
        eval(['Gamma_21(countd)=Gamma_21(countd)+Gamma0_21*3/ksi_21^3*chi_',num2str(n),'11^2/(alpha_',num2str(n),'11*sqrt(ksi_21^2-chi_',num2str(n),'11^2))*heaviside(ksi_21-chi_',num2str(n),'11)*avg_of_cossquare*avg_of_f_',num2str(n),'1;']);
        eval(['Gamma_10(countd)=Gamma_10(countd)+Gamma0_10*3/ksi_10^3*chi_',num2str(n),'11^2/(alpha_',num2str(n),'11*sqrt(ksi_10^2-chi_',num2str(n),'11^2))*heaviside(ksi_10-chi_',num2str(n),'11)*avg_of_cossquare*avg_of_f_',num2str(n),'1;']);
    end
    for n = 0:1:8
        eval(['Gamma_21(countd)=Gamma_21(countd)+Gamma0_21*3/ksi_21^3*chi_',num2str(n),'21^2/(alpha_',num2str(n),'21*sqrt(ksi_21^2-chi_',num2str(n),'21^2))*heaviside(ksi_21-chi_',num2str(n),'21)*avg_of_cossquare*avg_of_f_',num2str(n),'2;']);
        eval(['Gamma_10(countd)=Gamma_10(countd)+Gamma0_10*3/ksi_10^3*chi_',num2str(n),'21^2/(alpha_',num2str(n),'21*sqrt(ksi_10^2-chi_',num2str(n),'21^2))*heaviside(ksi_10-chi_',num2str(n),'21)*avg_of_cossquare*avg_of_f_',num2str(n),'2;']);
    end
    for n = 0:1:5
        eval(['Gamma_21(countd)=Gamma_21(countd)+Gamma0_21*3/ksi_21^3*chi_',num2str(n),'31^2/(alpha_',num2str(n),'31*sqrt(ksi_21^2-chi_',num2str(n),'31^2))*heaviside(ksi_21-chi_',num2str(n),'31)*avg_of_cossquare*avg_of_f_',num2str(n),'3;']);
        eval(['Gamma_10(countd)=Gamma_10(countd)+Gamma0_10*3/ksi_10^3*chi_',num2str(n),'31^2/(alpha_',num2str(n),'31*sqrt(ksi_10^2-chi_',num2str(n),'31^2))*heaviside(ksi_10-chi_',num2str(n),'31)*avg_of_cossquare*avg_of_f_',num2str(n),'3;']);
    end
    for n = 0:1:3
        eval(['Gamma_21(countd)=Gamma_21(countd)+Gamma0_21*3/ksi_21^3*chi_',num2str(n),'41^2/(alpha_',num2str(n),'41*sqrt(ksi_21^2-chi_',num2str(n),'41^2))*heaviside(ksi_21-chi_',num2str(n),'41)*avg_of_cossquare*avg_of_f_',num2str(n),'4;']);
        eval(['Gamma_10(countd)=Gamma_10(countd)+Gamma0_10*3/ksi_10^3*chi_',num2str(n),'41^2/(alpha_',num2str(n),'41*sqrt(ksi_10^2-chi_',num2str(n),'41^2))*heaviside(ksi_10-chi_',num2str(n),'41)*avg_of_cossquare*avg_of_f_',num2str(n),'4;']);
    end
    for n = 0:1:1
        eval(['Gamma_21(countd)=Gamma_21(countd)+Gamma0_21*3/ksi_21^3*chi_',num2str(n),'51^2/(alpha_',num2str(n),'51*sqrt(ksi_21^2-chi_',num2str(n),'51^2))*heaviside(ksi_21-chi_',num2str(n),'51)*avg_of_cossquare*avg_of_f_',num2str(n),'5;']);
        eval(['Gamma_10(countd)=Gamma_10(countd)+Gamma0_10*3/ksi_10^3*chi_',num2str(n),'51^2/(alpha_',num2str(n),'51*sqrt(ksi_10^2-chi_',num2str(n),'51^2))*heaviside(ksi_10-chi_',num2str(n),'51)*avg_of_cossquare*avg_of_f_',num2str(n),'5;']);
    end
% end
% save('gamma_anharmonic_2_03.mat')