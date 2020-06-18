library(rjson)
dat = read.csv('~/SADA Interview/raw.txt', header = T)
dim(dat)[1] # Answer 1: 25500 rows
new_dat = dat[grep("^(-)*[0-9]+((.)*[0-9]*)$", dat$Profit..in.millions.),]
dim(new_dat)[1] # Answer 2: 25131
write(toJSON(new_dat), file="~/SADA Interview/data2.json")
tail((new_dat[order(as.numeric(as.character(new_dat$Profit..in.millions.))),]), 20)
# Answer 3:
#       Year Rank                Company Revenue..in.millions. Profit..in.millions.
# 25024 2005   24                 Pfizer                 52921                11361
# 24003 2003    3            Exxon Mobil                182466                11460
# 23010 2001   10 Verizon Communications                 64707                11797
# 23005 2001    5       General Electric                129853                12735
# 25006 2005    6          ChevronTexaco                147967                13328
# 23006 2001    6              Citigroup                111826                13519
# 23506 2002    6       General Electric                125913                13684
# 24005 2003    5       General Electric                131698                14118
# 23507 2002    7              Citigroup                112022                14126
# 25018 2005   18  Bank of America Corp.                 63324                14143
# 24505 2004    5       General Electric                134187                15002
# 24006 2003    6              Citigroup                100789                15276
# 23502 2002    2            Exxon Mobil                191581                15320
# 25005 2005    5       General Electric                152363                16593
# 25008 2005    8              Citigroup                108276                17046
# 23001 2001    1            Exxon Mobil                210392                17720
# 24508 2004    8              Citigroup                 94713                17853
# 24502 2004    2            Exxon Mobil                213199                21510
# 22002 1999    2             Ford Motor                144416                22071
# 25002 2005    2            Exxon Mobil                270772                25330
nlevels(new_dat$Company) # Answer 4: 1887
freq_dat = as.data.frame(table(new_dat$Company))
tail((freq_dat[order(as.numeric(as.character(freq_dat$Freq))),]), 10)
# Answer 5:
#                    Company Freq
# 1665             Textron   51
# 1746              Unisys   51
# 1757 United Technologies   51
# 1767              Unocal   51
# 1776                 USG   51
# 1848        Weyerhaeuser   51
# 1851           Whirlpool   51
# 1874               Wyeth   51
# 1274           OfficeMax   55
# 331                  CBS   57

x = freq_dat$Var1
y = freq_dat$Freq
x[y == 1]
# Answer 6:
# [1] ACX Technologies                   ADC Telecommunications             Adelphia Communications            Allen Group                        Amalgamated Sugar                  AMBAC Industries                  
# [7] American Chicle                    American Medical Holdings          Amphenol-Borg Electronics          Associates First Capital           Assurant                           ATCOR                             
# [13] Athlone Industries                 AXA Financial                      B.V.D.                             BATUS                              BayNetworks                        Beazer Homes USA                  
# [19] Bell Atlantic                      Bohn Aluminum & Brass              Borden Chemicals & Plastics        Briggs Manufacturing               Brown Co.                          Budget Group                      
# [25] Bullard                            C. Brewer                          Capitol Industries                 Caremark International             Cincinnati Financial               Circle K                          
# [31] Clevite Industries                 Clinton Foods                      Coca-Cola Bottling Co. of New York Commonwealth United                Continental                        Cooper Labs                       
# [37] Core-Mark International            Crouse-Hinds                       Cuban-American Sugar               Danly Machine Specialties          Dataproducts                       Detroit Diesel                    
# [43] Diamond-Bathurst                   DIRECTV Group                      Dorr-Oliver                        Draper                             DSC Communications                 E.T. Barwick Industries           
# [49] Enbridge Energy Partners           Envirodyne Industries              First Chicago Corp.                First Fidelity Bancorp.            First Mississippi                  Fisher-Price                      
# [55] Fisher Scientific Group            Flour Mills of America             Foamex International               Foundation Health Systems          Frederick & Herrud                 General American Transportation   
# [61] General Cable                      Giddings & Lewis                   Godchaux Sugars                    Goodall-Sanford                    Grand Union Holdings               Graniteville Co.                  
# [67] Great Atlantic & Pacific Tea       Grolier Society                    Grow Group                         HealthTrust                        Henley Manufacturing               Horsehead Industries              
# [73] Hovnanian Enterprises              Hudson Pulp & Paper                Idacorp                            Integrated Health Services         Interim Services                   International Cellucotton Products
# [79] International Foodservice Systems  International Packers              Itek                               Ivax                               J.P. Industries                    JDS Uniphase                      
# [85] Kenner Parker Toys                 Knoll International Holdings       Kohler                             LandAmerica Financial              Liberty Media                      Lion Oil                          
# [91] Liquid Carbonic                    Ludlow                             Mallinckrodt                       Management Assistance              Marquette Cement Manufacturing     Marshall-Wells                    
# [97] MCI                                MDC Holdings                       Mercantile Bancorp.                MID-AMERICA DAIRYMEN               Mid-Continent Petroleum            MidAmerican Energy Holdings       
# [103] Miniscribe                         Nebraska Consolidated Mills        Neiman Marcus                      Nekoosa-Edwards Paper              New England Electric Sys.          New England Mutual Life Ins.      
# [109] New York Shipbuilding              News Corp.                         NI Industries                      Niles-Bement-Pond                  Norris-Thermador                   North American Coal               
# [115] NSTAR                              Old Republic Intl.                 Omega-Alpha                        Oregon Steel Mills                 Peabody Energy                     Pennzoil-Quaker State             
# [121] Pittsburgh Coke & Chemical         Pneumo Dynamics                    PolyOne                            Precision Castparts                Prentice-Hall                      ProSource                         
# [127] ReliaStar Financial                Remington Rand                     Roadway                            Robertshaw-Fulton Controls         Rochester & Pittsburgh Coal        RPM International                 
# [133] Rykoff-Sexton                      S & W Fine Foods                   S.S. Pierce                        Santa Fe Pacific                   Seeger Refrigerator                Service Corp. Intl.               
# [139] Shawmut National Corp.             Sheller Manufacturing              Shoe Corp. of America              Southern Industries                Specialty Coatings International   Spherion                          
# [145] Spiegel                            Staff Leasing                      Standard Motor Products            Stater Bros. Holdings              Stromberg-Carlson                  SuCrest                           
# [151] Summit Bancorp                     Sun Healthcare Group               Sunray Oil                         Teleflex                           Tellabs                            Texas Oil & Gas                   
# [157] Texas Utilities                    Titanium Metals Corp. of America   Toll Brothers                      Tonka                              Transco Energy                     Travelers Property Casualty       
# [163] Truax-Traer Coal                   TRW Automotive Holdings            Tung-Sol Electric                  UGI                                Union Planters Corp.               United States Filter              
# [169] United States Shoe                 Universal Forest Prods.            Vector Group                       Visking                            Vitro Corp. of America             Washington Group Intl.            
# [175] Weatherhead                        Wendy's International              Whole Foods Market                 Winnebago Industries               WLR Foods                          World Fuel Services               
# [181] Young (L.A.) Spring & Wire         Zurn Industries 

