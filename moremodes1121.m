clear

load('gamma_anharmonic_2_03.mat')
avg_of_cossquare = 1/2;S = zeros(3001,301);

%g_wwprime = q^2 * d_21 * d_10 * hbar /(2 * epsilon_0 * hbar^2) * avg_of_cossquare * (2 * c^2);
%%

singdtime = 0;
% for countd = 2401:2600
    countd = 451;

    d_my = 0.0e-6 + (countd-1) * 0.001e-6;%width of myeline sheath

    b = d_my + a;
    % ksi_10 = omega_10  * b  / c;
    ksi_21 = omega_21  * b  / c;
    
    Gammap_10 = Gamma_10(countd);Gammap_21 = Gamma_21(countd);
    tic;
    % parfor countl = 1:301%length of myeline sheath
        countl = 301;
        L_my = (countl-1) * 1e-6 + 200e-6;
        % V = L_my * pi  * b^2;%d/(d+r)=0.6 formula by definition
        
        % omega = gpuArray(c * sqrt((chi_011/b)^2+((1:400)*pi/L_my).^2));
        omega = c * sqrt((chi_011/b)^2+((0:400)*pi/L_my).^2);
        avg = ones(1,400)*avg_of_f_01;
        chi = ones(1,400)*chi_011;
        omega = cat(2,omega,c * sqrt((chi_111/b)^2+((0:400)*pi/L_my).^2));
        avg = cat(avg,ones(1,400)*avg_of_f_11);
        chi = cat(chi,ones(1,400)*chi_111);
        omega = cat(2,omega,c * sqrt((chi_211/b)^2+((0:400)*pi/L_my).^2));
        avg = cat(avg,ones(1,400)*avg_of_f_21);
        chi = cat(chi,ones(1,400)*chi_211);
        omega = cat(2,omega,c * sqrt((chi_021/b)^2+((0:400)*pi/L_my).^2));
        avg = cat(avg,ones(1,400)*avg_of_f_02);
        chi = cat(chi,ones(1,400)*chi_021);
        omega = cat(2,omega,c * sqrt((chi_311/b)^2+((0:400)*pi/L_my).^2));
        avg = cat(avg,ones(1,400)*avg_of_f_31);
        chi = cat(chi,ones(1,400)*chi_311);
        omega = cat(2,omega,c * sqrt((chi_121/b)^2+((0:400)*pi/L_my).^2));
        avg = cat(avg,ones(1,400)*avg_of_f_12);
        chi = cat(chi,ones(1,400)*chi_111);
        omega = cat(2,omega,c * sqrt((chi_411/b)^2+((0:400)*pi/L_my).^2));
        avg = cat(avg,ones(1,400)*avg_of_f_11);
        chi = cat(chi,ones(1,400)*chi_111);
        % omega = cat(2,omega,heaviside(ksi_21 - chi_221)* c * sqrt((chi_221/b)^2+((1:400)*pi/L_my).^2));
        % omega = cat(2,omega,heaviside(ksi_21 - chi_031)* c * sqrt((chi_031/b)^2+((1:300)*pi/L_my).^2));
        % omega = cat(2,omega,heaviside(ksi_21 - chi_511)* c * sqrt((chi_511/b)^2+((1:300)*pi/L_my).^2));
        % omega = cat(2,omega,heaviside(ksi_21 - chi_321)* c * sqrt((chi_321/b)^2+((1:300)*pi/L_my).^2));
        % omega = cat(2,omega,heaviside(ksi_21 - chi_611)* c * sqrt((chi_611/b)^2+((1:300)*pi/L_my).^2));
        % omega = cat(2,omega,heaviside(ksi_21 - chi_131)* c * sqrt((chi_131/b)^2+((1:300)*pi/L_my).^2));
        % omega = cat(2,omega,heaviside(ksi_21 - chi_421)* c * sqrt((chi_421/b)^2+((1:300)*pi/L_my).^2));
        % omega = cat(2,omega,heaviside(ksi_21 - chi_711)* c * sqrt((chi_711/b)^2+((1:300)*pi/L_my).^2));
        % omega = cat(2,omega,heaviside(ksi_21 - chi_231)* c * sqrt((chi_231/b)^2+((1:300)*pi/L_my).^2));
        % omega = cat(2,omega,heaviside(ksi_21 - chi_041)* c * sqrt((chi_041/b)^2+((1:300)*pi/L_my).^2));
        % omega = cat(2,omega,heaviside(ksi_21 - chi_811)* c * sqrt((chi_811/b)^2+((1:200)*pi/L_my).^2));
        % omega = cat(2,omega,heaviside(ksi_21 - chi_521)* c * sqrt((chi_521/b)^2+((1:200)*pi/L_my).^2));
        % omega = cat(2,omega,heaviside(ksi_21 - chi_331)* c * sqrt((chi_331/b)^2+((1:200)*pi/L_my).^2));
        % omega = cat(2,omega,heaviside(ksi_21 - chi_141)* c * sqrt((chi_141/b)^2+((1:200)*pi/L_my).^2));
        % omega = cat(2,omega,heaviside(ksi_21 - chi_911)* c * sqrt((chi_911/b)^2+((1:200)*pi/L_my).^2));
        % omega = cat(2,omega,heaviside(ksi_21 - chi_621)* c * sqrt((chi_621/b)^2+((1:200)*pi/L_my).^2));
        % omega = cat(2,omega,heaviside(ksi_21 - chi_431)* c * sqrt((chi_431/b)^2+((1:200)*pi/L_my).^2));
        % omega = cat(2,omega,heaviside(ksi_21 - chi_1011)* c * sqrt((chi_1011/b)^2+((1:200)*pi/L_my).^2));
        % omega = cat(2,omega,heaviside(ksi_21 - chi_241)* c * sqrt((chi_241/b)^2+((1:200)*pi/L_my).^2));
        % omega = cat(2,omega,heaviside(ksi_21 - chi_721)* c * sqrt((chi_721/b)^2+((1:200)*pi/L_my).^2));
        % omega = cat(2,omega,heaviside(ksi_21 - chi_051)* c * sqrt((chi_051/b)^2+((1:200)*pi/L_my).^2));
        % omega = cat(2,omega,heaviside(ksi_21 - chi_1111)* c * sqrt((chi_1111/b)^2+((1:200)*pi/L_my).^2));

        omega(omega(:)>6e14) = [];
        omega(omega(:)<4e14) = [];
        
        n = repmat(ones(1,length(omega)),length(omega),1);
        omega = omega .* n;
        % g_wwprime = q^2 * d_21 * d_10 * hbar /(2 * epsilon_0 * hbar^2) ./ ...,
        %     sqrt(omega .* omega') * avg_of_cossquare * avg_of_f_01 * (2 * chi_011^2 * c^2)/(V*b^2*alpha_011);
        C = 1 ./ ...,
            (((omega - omega_10).*1i - Gammap_10 /2).*((omega + omega' - omega_21 - omega_10).*1i - Gammap_21 /2));

        C = C./sqrt(sum(C.*conj(C),"all"));

        [U,LAMDA,Vjuzhen]=svd(C);
        LAMDA = LAMDA .^2;

        % S(countd,countl) = sum(-sum(LAMDA .* log2(LAMDA)/log2(length(LAMDA)),'OMITNAN'),'all');
        Svalue = sum(-sum(LAMDA .* log2(LAMDA)/log2(length(LAMDA)),'OMITNAN'),'all');
        %disp(length(LAMDA))

    % end
    singdtime = singdtime + toc;
    disp(singdtime)
    disp(countd)
% end
% save('moremodes2401-2600.mat')