-----------------------------------------------------------------------------------
-- This file has been developed exclusively for the mod "Jão the Great Summoner" --
--(http://steamcommunity.com/sharedfiles/filedetails/?id=572470943). 		     --
-- Any unauthorized use will be reported to the DMCA. 				             --
-- To use any file or sprite ask my permission.					                 --
--										                                         --
-- Author: Paulo Victor de Oliveira Leal					                     --
-- Contact: ciclopiano@gmail.com						                         --
-----------------------------------------------------------------------------------
-----------------------------------------------------------------------------------

return {
    SPEECH_PETS = 
    {
        PORTUGUES =
        {
            SKIP =
            { 
                ATTACK = "SOCO DE PEDRA!",
                
                STATUS = 
                {
                    EMPTY = "Estou com muita fome mestre, por favor me de algumas pedras!",
                    HALF  = "Ate que algumas pedras viriam bem...",
                    FULL  = "Estou bem mestre!\n Pronto para trabalhar!",
                },
                    
                ACTION = 
                {
                    PICK = "Vou pegar tudo que esteja no chao!",
                    DROP = "Certo, esta tudo aqui!",
                    FAIL = "Nao tenho nada comigo",
                },
                
                EAT =
                {
                    FULL  = "Ja estou muito cheio",
                    EMPTY = "Obrigado mestre!",  
                },
                
                REFUSE = "Mestre, eu nao posso comer isso!",
                
                DISTANCIA =
                {
                      FAR   = "Onde esta meu mestre!",
                      CLOSE = "Mestre nao saia sem min!",
                },
            },
            
            RHINO =
            {
                ATTACK = "RHINO ESMAGA!...",
                
                STATUS =
                {
                    EMPTY = "FOME! FOME! COMIDAAAA!",
                    HALF  = "Comida! Quase cheio!",
                    FULL  = "Cheio! Cheio! \n Destruir coisas!",
                },
                
                ACTION =
                {
                    SMASH = "DESTRUIR!!",
                    FAIL  = "Rhino... nao... destruir... isso!",
                },
                
                EAT =
                {
                    FULL  = "Cheio!!!",
                    EMPTY = "DESTRUIR COISAS AGORA!!!",  
                },
                
                REFUSE = "Isso nao e carne!",
                
                DISTANCIA =
                {
                      FAR   = "MESTREEE! VAMOS DESTRUIR COISAS!",
                      CLOSE = "Encontrei... Vamos destruir agora?",
                },
            },
            
            CHOP = 
            {
                ATTACK = "VAIII... MORRERRRR...",
                
                STATUS = 
                {
                    EMPTY = "Preciso de comida!",
                    HALF  = "Estou meio cheio",
                    FULL  = "Estou cheio",    
                },
                
                ACTION =
                {
                    PROTECT = "Certo, aparecam meus guardas!!",
                    FAIL    = "Chop não proteger mais!",  
                },
                
                EAT =
                {
                    FULL  = "Estou... Cheio...",
                    EMPTY = "Obrigado...",  
                },
                
                REFUSE = "Eu... Nao... Como... Isso...",
                
                DISTANCIA =
                {
                      FAR   = "MEEE..SSS.TREEEE..!!!",
                      CLOSE = "PROTEGERRRR...!!!",
                },
            },
            
            MINICHOP = 
            {
                ATTACK = {},
                
                KEEPFACE = {},
                
                ACTION =
                {
                    FIGHT  = {"PELO MESTRE!", "DEFENDA!", "SALVE O MESTRE!"},
                    GOHOME = {"PRECISO DEFENDER!", "EU PROTEJO", "MESTRE! MESTRE!"},
                    TORCH  = {"A FOGUEIRA TA ACABANDO", "FACA A FOGUEIRA BRILHAR", "MAIS LENHA"},
                    LOOKAT = {"VOCE SAIA AGORA", "VA EMBORA", "VOCE NAO FICA"},  
                },
            },
            
            JILL =
            {
                ATTACK = {},
                
                STATUS =
                {
                    EMPTY = "Mooo!",
                    HALF  = "Mooo! Muuu!",
                    FULL  = "Mooo! Muuu! Mooo!",    
                }, 
                
                ACTION =
                {
                        
                }, 
                
                EAT =
                {
                    FULL  = "Mooo...",
                    EMPTY = "Moooo!...",  
                },
                
                REFUSE = "Mooo!... Moo!",
                
                DISTANCIA =
                {
                      FAR   ="",
                      CLOSE ="",
                },
            },
            
            ARON =
            {
                ATTACK = {},
                
                STATUS =
                {
                    EMPTY = "CARNE... Eu quero carne!",
                    HALF  = "Squeak, squeak!",
                    FULL  = "Squeak, squeak, squeak!",
                },
                
                ACTION = 
                {
                    TRANSFORMA = "Estou livre...!",
                    DESTRANSFORMA = "Naoooo...!",                    
                },
                
                EAT =
                {
                    FULL  = "Squeak!",
                    EMPTY = "Squeak, squeak!...",  
                },
                
                REFUSE = "Squeakkkkk!",
                
                DISTANCIA =
                {
                      FAR   = "MESTRE!!!",
                      CLOSE = "Ufa! Encontrei",
                },
            },
            
            WEREARON = 
            {
                ATTACK = "VOCE JA ERA!!!",
                
                STATUS = 
                {
                    EMPTY = "CARNE... Eu quero carne!",
                    HALF  = "Comidaaa!",
                    FULL  = "Cheio! Vamos caçar!",            
                },
                
                ACTION =
                {
                    HUNTER = "CAÇARRR!!",
                    FAIL = "Nao posso atacar isso!!",
                },
                
                EAT =
                {
                    FULL  = "Cheio! Quero atacar!...",
                    EMPTY = "Comer agora, depois atacar!",  
                },
                
                REFUSE = "Squeakkkkk!",
                
                DISTANCIA =
                {
                      FAR   = "",
                      CLOSE = "",
                },
            },
            
            JARVI =
            {
                SKIP  = "O Skip esta com probleamas mestre...",
                RHINO = "Mestre o Rhino esta sendo atacado...",
                CHOP  = "A base precisa de ajuda, o Chop foi atacado...",
                JILL  = "Mestre ajude a Jill, ela nao ataca lembra?...",
                ARON  = "O Aron esta fora de controle...",
                JAO =
                {
                    HEALTH = "Mestre descance um pouco... \n ...sua vida esta baixa",
                    SANITY = "Sua sanidade esta baixa senhor... \n afaste-se dos outros para que eu possa regenera-la",
                    HUNGER = "Esta com fome mestre? \nQuer que peca para o Aron conseguir umas carnes...",
                },
                ENEMIES =
                { 
                    GIANT = "GIGANTE A FRENTE... Recue mestre!",
                    SMALL = "Pequeno grupo de inimigos a frente, tenha cuidado",
                    HUGE  = "Varios monstros a frente melhor pedir ajuda!",
                },
                  
            },
            
            JAO =
            {
                SUMMON =
                {
                    SKIP  = "APARECA MEU ESCUDO DE PEDRA!!!",
                    RHINO = "VENHA SENHOR DA DESTRUICAO!!!",
                    CHOP  = "EU INVOCO A ARVORE DA PROTECAO, CHOP!!!",
                    JILL  = "EU CONJURO A MONTARIA MAIS RAPIDA, JILL!!!",
                    ARON  = "DAS SOMRAS EU INVOCO ARON!!!",   
                },
                
                FEED =
                {
                    SKIP  = 
                    {
                        ZERO = "Como voce esta, Skip?", 
                        UM   = "Esta com fome parceiro?", 
                        DOIS = "Coma alguma coisa.",
                        FAIL = "Tenho que invoca-lo primeiro!",
                    },   
                    RHINO = {
                        ZERO = "Quem ta com Fominha?", 
                        UM   = "Olha so o pedacao de carne", 
                        DOIS = "Quem quer um bifinho?",
                        FAIL = "Cade o Rhino? Esqueci de invoca-lo",
                    },
                    CHOP  = 
                    {
                        ZERO = "Esta com fome, Chop?", 
                        UM   = "Vai uma adubo ai?", 
                        DOIS = "Acho que voce precisa de um fertilizante...",
                        FAIL = "Oops esqueci do chop",
                    },
                    JILL  = 
                    {
                        ZERO = "Quer um capim?", 
                        UM   = "Eu tenho umas folhinas aqui...", 
                        FAIL = "A Jill nem esta aqui", 
                    },
                    ARON  = 
                    {
                        ZERO = "Quer uma cenoura amiguinho?", 
                        UM   = "Tenho algumas frutas aqui!", 
                        FAIL = "Onde esta aquele coelho bonitinho?",
                    },            
                },
                
                ACTION =
                {
                    SKIP  = 
                    {
                        ZERO = "Skip, pegue esses itens", 
                        UM   = "Vai pegar aquelas coisas", 
                        FAIL = "Estou velho nem o invoquei ainda!",
                    },
                    RHINO = 
                    {
                        ZERO = "Rhino, destrua aquilo ali!", 
                        UM   = "Destrua isso!", 
                        FAIL = "Oops nem o invoquei ainda!",
                    },
                    CHOP  = 
                    {
                        ZERO = "Chop, proteja essa area", 
                        UM   = "Defenda aqui!", 
                        FAIL = "Estou velho nem o invoquei ainda!",
                    },
                    JILL  = 
                    {
                        ZERO = {}, 
                        UM   = {}, 
                        FAIL = {},
                    },
                    ARON  = 
                    {
                        ZERO = "Aron, transform-se", 
                        UM   = "Deixe o monstro sair!", 
                        FAIL = "Oops nem o invoquei ainda!",
                    },
                },
                
                SECONDACTION =
                {
                    SKIP  = {
                        ZERO = "Skip, coloque aqui os itens que voce pegou", 
                        UM   = "Deixe tudo aqui", 
                        FAIL = "Estou velho nem o invoquei ainda!",
                    },
                    RHINO = {},
                    CHOP  = {},
                    JILL  = {},
                    ARON  = 
                    {
                        ZERO = "Aron, ataque aquele cara ali!", 
                        UM   = "Ataque ele!", 
                        FAIL = "Oops nem o invoquei ainda!",
                    },
                },
                
                CALL =
                {
                    SKIP  = "SKIP!!! ME DEFENDA!",
                    RHINO = "Rhino, preciso de voce aqui!",
                    CHOP  = "Chop! Preciso de forca aqui",
                    JILL  = "Jill, vamos galopar para longe daqui!",
                    ARON  = "Aron! Preciso da sua falta de sanidade aqui!",
                },
                
                WAIT =
                {
                    SKIP  = "Skip, espere aqui por enquanto...",
                    RHINO = "Nao quebre nada, Rhino",
                    CHOP  = "Chop! Vai fazer fotossintese por enquanto!",
                    JILL  = "Jill, ja volto",
                    ARON  = "Tente nao atacar nada, Aron!",
                },
            },
        },

        ENGLISH =
        {
            SKIP =
            { 
                ATTACK = "STONE PUNCH!",
                
                STATUS = 
                {
                    EMPTY = "I'm very hungry master, please give me some rocks!",
                    HALF  = "Until some stones would well ...",
                    FULL  = "I'm fine master! \n Ready to work!",
                },
                    
                ACTION = 
                {
                    PICK = "I'll get all that is on the floor!",
                    DROP = "Okay, it's all here!",
                    FAIL = "I don't have anything with me",
                },
                
                EAT =
                {
                    FULL  = "I'm already very full",
                    EMPTY = "Thank you master!",  
                },
                
                REFUSE = "Master, I can't eat that!",
                
                DISTANCIA =
                {
                      FAR   = "Where is my master!",
                      CLOSE = "Master not leave without me!",
                },
            },
            
            RHINO =
            {
                ATTACK = "RHINO SMASH!...",
                
                STATUS =
                {
                    EMPTY = "HUNGRY! HUNGER! FOOD!",
                    HALF  = "Food! Almost full!",
                    FULL  = "Full! Full! \n Destroy things!",
                },
                
                ACTION =
                {
                    SMASH = "DESTROY!!",
                    FAIL  = "Rhino ... not ... ... destroy it!",
                },
                
                EAT =
                {
                    FULL  = "Full!!!",
                    EMPTY = "DESTROY THINGS NOW !!!",  
                },
                
                REFUSE = "That's not meat!",
                
                DISTANCIA =
                {
                      FAR   = "MASTERRR! WE WILL DESTROY THINGS!",
                      CLOSE = "I found ... We will destroy now?",
                },
            },
            
            CHOP = 
            {
                ATTACK = "GONNA... DIE...",
                
                STATUS = 
                {
                    EMPTY = "I... need... food...!",
                    HALF  = "I'm... half... full...",
                    FULL  = "I'm... full",    
                },
                
                ACTION =
                {
                    PROTECT = "All right..., appears my guards!!...",
                    FAIL    = "Chop... doesn't... protect... more!",  
                },
                
                EAT =
                {
                    FULL  = "I'm... full...",
                    EMPTY = "Thanks...",  
                },
                
                REFUSE = "I... don't... like... it...",
                
                DISTANCIA =
                {
                      FAR   = "MA..SSS.TEERR..!!!",
                      CLOSE = "PROTECTTT...!!!",
                },
            },
            
            MINICHOP = 
            {
                ATTACK = {},
                
                KEEPFACE = {},
                
                ACTION =
                {
                    FIGHT  = {"FOR MASTER!", "DEFEND!", "SAVE MASTER!"},
                    GOHOME = {"NEED DEFEND!", "I PROTECT", "MASTER! MASTER!"},
                    TORCH  = {"THE FIRE IS RUNNING OUT", "MAKE FIRE SHINE", "MORE FIRE"},
                    LOOKAT = {"YOU GET OUT", "GO WAY", "YOU NO STAY"},  
                },
            },
            
            JILL =
            {
                ATTACK = {},
                
                STATUS =
                {
                    EMPTY = "Mooo!",
                    HALF  = "Mooo! Muuu!",
                    FULL  = "Mooo! Muuu! Mooo!",    
                }, 
                
                ACTION =
                {
                        
                }, 
                
                EAT =
                {
                    FULL  = "Mooo...",
                    EMPTY = "Moooo!...",  
                },
                
                REFUSE = "Mooo!... Moo!",
                
                DISTANCIA =
                {
                      FAR   ="",
                      CLOSE ="",
                },
            },
            
            ARON =
            {
                ATTACK = {},
                
                STATUS =
                {
                    EMPTY = "MEET... I need meat!",
                    HALF  = "Squeak, squeak!",
                    FULL  = "Squeak, squeak, squeak!",
                },
                
                ACTION = 
                {
                    TRANSFORMA = "I' free...!",
                    DESTRANSFORMA = "Nooo...!",                    
                },
                
                EAT =
                {
                    FULL  = "Squeak!",
                    EMPTY = "Squeak, squeak!...",  
                },
                
                REFUSE = "Squeakkkkk!",
                
                DISTANCIA =
                {
                      FAR   = "MASTER!!!",
                      CLOSE = "I found you!!",
                },
            },
            
            WEREARON = 
            {
                ATTACK = "You're done!!!",
                
                STATUS = 
                {
                    EMPTY = "MEAT... I need meat!",
                    HALF  = "Fooddd!",
                    FULL  = "Full! Let's hunt!",            
                },
                
                ACTION =
                {
                    HUNTER = "HUNTTT!!",
                    FAIL = "I can't attack this...",
                },
                
                EAT =
                {
                    FULL  = "Full! I want to attack!...",
                    EMPTY = "Eat now, then attack!",  
                },
                
                REFUSE = "Squeakkkkk!",
                
                DISTANCIA =
                {
                      FAR   = "",
                      CLOSE = "",
                },
            },
            
            JARVI =
            {
                SKIP  = "The Skip is in trouble",
                RHINO = "Master! Rhino is being attacked...",
                CHOP  = "The base need help, Chop was attacked ...",
                JILL  = "Master help Jill, she not attacks remember? ...",
                ARON  = "Aron is out of control",
                JAO =
                {
                    HEALTH = "Master some rest \n your life is low",
                    SANITY = "His health is low. \n Step away from the others so I can regenerates it",
                    HUNGER = "This hungry Master? \n Whatever sins for Aron get some meat ...",
                },
                ENEMIES =
                { 
                    GIANT = "GIANT FORWARD... Rescue master!",
                    SMALL = "Small group of enemies to face, be careful",
                    HUGE  = "Several monsters forward, better ask for help!",
                },
                  
            },
            
            JAO =
            {
                SUMMON =
                {
                    SKIP  = "APPEARS MY STONE SHIELD!!!",
                    RHINO = "COME LORD OF DESTRUCTION!!!",
                    CHOP  = "I SUMMON THE TREE OF PROTECTION, CHOP!!!",
                    JILL  = "I CONJURE RIDE MORE FAST, JILL!!!",
                    ARON  = "SHADOW I CALL UPON ARON!!!",   
                },
                
                FEED =
                {
                    SKIP  = 
                    {
                        ZERO = "How are you, Skip?", 
                        UM   = "Are you hungry buddy?", 
                        DOIS = "Eat something.",
                        FAIL = "I have to invoke it first!",
                    },   
                    RHINO = 
                    {
                        ZERO = "Who's with greedy?", 
                        UM   = "Look so the piece of meat", 
                        DOIS = "Who wants a piece of meat?",
                        FAIL = "Where is Rhino? I forgot to invoke it",
                    },
                    CHOP  = 
                    {
                        ZERO = "Are you hungry?", 
                        UM   = "Go one fertilizer there?", 
                        DOIS = "I think you need a fertilizer ...",
                        FAIL = "Oops I forgot the Chop",
                    },
                    JILL  = 
                    {
                        ZERO = "Want a grass?", 
                        UM   = "I have a little leaves here ...", 
                        FAIL = "Jill is not here", 
                    },
                    ARON  = 
                    {
                        ZERO = "You want a carrot, buddy?", 
                        UM   = "I have some fruit here! ", 
                        FAIL = "Where's that cute little bunny?",
                    },            
                },
                
                ACTION =
                {
                    SKIP  = 
                    {
                        ZERO = "Skip, take these items", 
                        UM   = "Go get those things", 
                        FAIL = "I'm old nor even invoked!",
                    },
                    RHINO = 
                    {
                        ZERO = "Rhino, destroy it there!", 
                        UM   = "Destroy it!", 
                        FAIL = "Oops nor even invoked!",
                    },
                    CHOP  = 
                    {
                        ZERO = "Chop, protect this area", 
                        UM   = "Defend here!", 
                        FAIL = "I'm old nor even invoked!",
                    },
                    JILL  = 
                    {
                        ZERO = {}, 
                        UM   = {}, 
                        FAIL = {},
                    },
                    ARON  = 
                    {
                        ZERO = "Aron, transform yourself", 
                        UM   = "Let the monster out!", 
                        FAIL = "Oops nor even invoked!",
                    },
                },
                
                SECONDACTION =
                {
                    SKIP  = {
                        ZERO = "Skip, place here the items you picked up", 
                        UM   = "Leave it here", 
                        FAIL = "I'm old nor even invoked!",
                    },
                    RHINO = {},
                    CHOP  = {},
                    JILL  = {},
                    ARON  = 
                    {
                        ZERO = "Aron, face the attack there!", 
                        UM   = "Attack him!", 
                        FAIL = "Oops nor even invoked!",
                    },
                },
                
                CALL =
                {
                    SKIP  = "SKIP!!! DEFEND ME!",
                    RHINO = "Rhino, I need you here!",
                    CHOP  = "Chop! I need strength here",
                    JILL  = "Jill, we galloped away from here!",
                    ARON  = "Aron! I need your lack of sanity here!",
                },
                
                WAIT =
                {
                    SKIP  = "Skip, wait here for a while ...",
                    RHINO = "Don't break anything, Rhino",
                    CHOP  = "Chop! Will do photosynthesis yet!",
                    JILL  = "Jill, be right back",
                    ARON  = "Try not to attack anything, Aron!",
                },
            },
        },

    }
}