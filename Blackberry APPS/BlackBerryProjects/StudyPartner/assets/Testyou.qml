import bb.cascades 1.2
import CustomTimer 1.0
import bb.system 1.0
import bb.multimedia 1.0
import bb.device 1.0



//POPULATE THE QUESTIONS AND CHECK SOCIAL INVOCATION AND POPULATE AN ARRAY OF ANSWERS THAT HAVE BEEN PAST

Page {
    id: game

    property int tmpscore:0
    property int numrandom
    property int randombefore
    property int score: 0
    property int segundos:0
    property int vidas:3
    property int preguntaN:1
    property int countAsk:0    
        
    property variant mathq:["13x13?","25x25","Atomic Weight of Oxygen","√8","15x15","3x3+10x2-10","Who discovered the proton?","Who formulated the gravity's law?","Who formulated E=MC^2","Atomic Number of Hydrogen","3x5+12/2","Which is the acceleration formula?","Who Discovered the electron?"," (√3+√8)(√3-2√2)"]
    property variant op1Array:["231","625","8","2√4","225","38","J.J Thompson","Aristoteles","Albert Einstein","3","33","a=Vf-Vo/t","James Chadwick","√3-2√2"]//0
    property variant op2Array:["169","710","16","2.1","125","19","E. Rutherford","Albert Einstein","Nikola Tesla","1","13.5","a=d/t","E. Rutherford","11+4√6"]//1
    property variant op3Array:["139","545","12","2√2","345","29","James Chadwick","Issac Newton","Galileo","6","21","a=t*d","J.J Thompson","-5"]//2
    property variant answArray:[1,0,1,2,0,1,1,2,0,1,2,0,2,2]
	
    function refresh(){
        
        numrandom = (Math.random()*9);
        
        if (numrandom == randombefore)
        	refresh();
        
        
        randombefore = numrandom;    
        
        countAsk = 0;
        contask.start();
        
        console.debug("NUMERO ALEATORIO" + numrandom);
        console.debug("NUMERO ALEATORIO ANTERIOR" + numrandom);

        
        option1.text = op1Array[numrandom];
        option2.text = op2Array[numrandom];
        option3.text = op3Array[numrandom];     
        
        questionlabel.text = mathq[numrandom];
        
        scorelabel.text = "Score: " + score;
        lifelabel.text =  "Lifes: " + vidas;
        
    }
    onCreationCompleted: {
        cancionBack.play();   
        contador.start();
        refresh();
    }
    
    titleBar:  TitleBar {
        kind: TitleBarKind.FreeForm
        kindProperties: FreeFormTitleBarKindProperties {
            Container {
                layout: DockLayout {
                }
                Label {
                    
                    text: "How much do you know?"
                    textStyle {
                        color: Color.White
                        fontWeight: FontWeight.Default
                        fontSize: FontSize.Large
                    }
                    verticalAlignment: VerticalAlignment.Center
                    horizontalAlignment: HorizontalAlignment.Center
                }
            }
        }
    }
    
     Container {
         background: backgroundGame.imagePaint
         
         Timer {
             id: contask
             interval: 1000
             onTimeout: {
                 countAsk += 1;
             }
         }
        
        Timer {
            id: contador
            interval: 1000
            onTimeout: {
                segundos += 1;
                tiempolabel.text = "Time: " + segundos;                
            }
        }
        Timer {
            id: toastcount
            interval: 800
            onTimeout: {
                incorrectToast.cancel();
                correctToast.cancel();
                toastcount.stop();
            }
        }
        Container {
            layout: DockLayout {
                
            }
            ImageView {
                imageSource: "Imagenes/Ecuaciones/FormulaBack.png"
                preferredHeight: 100
            }
        
		    Container {
		        topPadding: 20
		        preferredWidth: 768
		        preferredHeight: 100
		       layout: AbsoluteLayout {
               }
			        Label {
			        	translationY: 20
			        	translationX: 40
			            id: scorelabel
	                    text: "Score: ";   //time-question relationship
			        }
			        Label {
			            translationY: 20
			            translationX: 300
			            id: lifelabel
	                    text: "Lifes: ";
	              	}
			        Label {
			            translationY: 20
			            translationX: 520
		             id: tiempolabel
		             text: "Time: ";
		         }
		    }
	    }
	    

        Label {
            text: "Question: " + preguntaN
            horizontalAlignment: HorizontalAlignment.Center
        }
        Divider {
            
        }
        Label {
            id: questionlabel
            text: "Here is gonna be the Q"
            multiline: true
            horizontalAlignment: HorizontalAlignment.Center
        }
        
        Divider {
            
        }
        
        RadioGroup {
            horizontalAlignment: HorizontalAlignment.Center
            preferredWidth: 700
            id: selection
            Option { id: option1; text: "option 1";} 
            Option { id: option2; text: "option 2" }
            Option { id: option3; text: "option 3" }
        }
        
        Divider {
            
        }

        Button {
            id: mainbutton
            horizontalAlignment: HorizontalAlignment.Center
            
            text: "Next"
            onClicked: {
                
                preguntaN++;
                
                contask.stop();
                                                              
                if(selection.selectedIndex == answArray[numrandom]){
                    toastcount.start();
                    
                    greenLED.flash(1);
                    
                    if(preguntaN == 10){
                        correct10Sound.play();
                    }
                    if(preguntaN == 20){
                        correct20Sound.play();
                    }
                    else{
                        correctSound.play();
                    } 
                    
                    correctToast.show();
                    
                    console.debug("SEGUNDOS"+countAsk);
                    console.debug("SCORE ANTES:"+score);
                    tmpscore = (100+(preguntaN*10)-countAsk);
                    console.debug("TMP SCORE:"+tmpscore);
                    
                    game.score = game.score + tmpscore;
                    
                    console.debug("SCORE DESPUES:"+score);

                    scorelabel.text = "Score: " + score;
                }
                else {
                    vidas -=1;
                    if (vidas == 0){
                        //final del juego:
                        whiteLED.flash(1);
                        
                        //SONIDOS FINALES
                        if(game.score<300){
                            finalBad.play();
                        }
                        else{
                            finalApplause.play();
                        }
                        
                        contador.stop();
                        finishdialog.open();
                        
                    }
                    
                    
                    toastcount.start();
                    redLED.flash(1);
                    inCorrectSound.play();
                    incorrectToast.show();
                    scorelabel.text = "Score: " + score;
                    
                }
                selection.resetSelectedOption();
                refresh();
            }
        }
        
    }
     
     attachedObjects: [
         MediaPlayer {
             id: cancionBack
             sourceUrl: "/Sounds/Minigame.mp3"
         },
         
         ImagePaintDefinition {
             id: backgroundGame
             imageSource: "Imagenes/Back/GameBack.amd"
             repeatPattern: RepeatPattern.XY
         },
         
         Led {
             id: redLED
             color: LedColor.Red
         },
         Led {
             id: blueLED
             color: LedColor.Blue
         },
         Led {
             id: greenLED
             color: LedColor.Green
         },
         Led {
             id: whiteLED
             color: LedColor.White
         },
         MediaPlayer {
             id: correctSound
             sourceUrl: "/Sounds/Correct.mp3"
         },
         MediaPlayer {
             id: inCorrectSound
             sourceUrl: "/Sounds/Incorrect.mp3"
         },
         MediaPlayer {
             id: correct10Sound
             sourceUrl: "/Sounds/Correct10.mp3"
         },
         MediaPlayer {
             id: correct20Sound
             sourceUrl: "/Sounds/Correct20.mp3"
         },
         MediaPlayer {
             id: finalApplause
             sourceUrl: "/Sounds/FinalApplause.mp3"
         },
         MediaPlayer {
             id: finalBad
             sourceUrl: "/Sounds/FinalBad.mp3"
         },
         SystemToast {
             id: correctToast
             body: "Correct"
             onFinished: {
             
             }
         },
         SystemToast {
             id: incorrectToast
             body: "Incorrect"
             onFinished: {
                 
             }
         },
         Dialog {
             id: finishdialog
             Container {
                 preferredWidth: 768
                 preferredHeight: 1280
                 background: Color.create (0.0, 0.0, 0.0, 0.5)
                 layout: DockLayout {
                 }
                 
                 Container {
                     maxHeight: 450
                     horizontalAlignment: HorizontalAlignment.Center
                     verticalAlignment: VerticalAlignment.Center
                     
                     layout: DockLayout {
                     }
                     
                     ImageView {
                         horizontalAlignment: HorizontalAlignment.Center
                         preferredWidth: 700
                         preferredHeight: 750
                         imageSource: "Imagenes/customdialog_alarm.png"
                     }
                     
                     Container {
                         topPadding: 5
                         bottomPadding: 23
                         leftPadding: 23
                         horizontalAlignment: HorizontalAlignment.Fill
                         verticalAlignment: VerticalAlignment.Fill
                         Container {
                             topPadding: 10
                             horizontalAlignment: HorizontalAlignment.Center                        
	                         Label {
	                             text: "GAME OVER"
	                             textStyle.color: Color.White
	                             horizontalAlignment: HorizontalAlignment.Center
	                         }
                          }
                         
	                        Label {
	                             horizontalAlignment: HorizontalAlignment.Center
	                             multiline: true
	                             text: "¡You did excellent! "
	                        }
	                     
                         Label {
                             horizontalAlignment: HorizontalAlignment.Center
                             text: ""+score
                             textStyle{
                                 color: Color.DarkBlue
                                 fontSize: FontSize.XXLarge
                                 fontStyle: FontStyle.Italic
                                 
                             }
                         }
                         Container {
                             horizontalAlignment: HorizontalAlignment.Center
                             topPadding: 70
	                         Container {
	                             layout: StackLayout {
	                                 orientation: LayoutOrientation.LeftToRight
	                             }
	                             Button {
	                                 preferredWidth: 100
	                                 id: retrybutton
	                                 horizontalAlignment: HorizontalAlignment.Center
	                                 
	                                 text: "Retry"
	                                 onClicked: {
	                                     preguntaN = 1;
	                                     score=0;
	                                     segundos=0;
	                                     vidas=3;
	                                     finishdialog.close();
	                                     refresh();
	                                     contador.start();
	                                 }
	                             }// button
	                             Button {
                                     preferredWidth: 100
                                     
	                                 id: sharebutton
	                                 horizontalAlignment: HorizontalAlignment.Center
	                                 
	                                 text: "¡Share my score!"
	                                 onClicked: {
	                                     
	                                     blueLED.flash(1);
	                                     mainObj.share("Wow! My score in 'Studdy Game' was amazing:  " + score);
	                                 }
	                             }
	                             
	                         }
                          }

                     }// Container
                 }// Container
             }// Container
         }
     ]
}
