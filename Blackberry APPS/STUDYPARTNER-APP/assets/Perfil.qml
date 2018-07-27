import bb.cascades 1.2

NavigationPane {
    id: navigation
    property variant sheet
    function onPerfilSalvado(){
        console.debug("SE INVOKO A LA ACCION DE QUE SE SALVO");
        perfilimagen.imageSource=mainObj.loadFoto();
        nombre.text = mainObj.loadNombre();
        //imagen.imageSource = mainObj.loadFoto();
        escuela.text=mainObj.loadEscuela();
        semestre.text = mainObj.loadSemestre();
        grupo.text = mainObj.loadGrupo();
        fechaInicialLabel.text = "Start of classes:  "  + mainObj.loadFechaInicio();
        fechafinalLabel.text = "End of classes:  "  + mainObj.loadFechaFinal();
        
        progreso.value = mainObj.progress();
        progresoLabel.text = "Progress: "+progreso.value+"%    -    "+mainObj.daysLeft() + " Days left"
        
        
        //IMPLEMENTAR EN FUNCION DE C PARA QUE QUEDE ESTATICO.... Y NO SE CAMBIE POR LA DEFAULT
        
        var diasR = mainObj.daysLeft();
        if(diasR <0){
            moralLabel.text = "¡WOW! you are awsome, you finished."
        }
        else if(diasR>=0 && diasR <20){
            moralLabel.text = "C'mon Buddy! You can do it."
        }
        else if(diasR>=20 && diasR <40){
            moralLabel.text = "Just a little more, ¡you are the best!."
        }
        
    }
    onCreationCompleted: {
        
        mainObj.PerfilSalvado.connect(onPerfilSalvado);

        if (mainObj.loadNombre() == ""){
            console.debug("NO HAY NOMBRE ASI QUE ABRIMOS LA VISTA NO?");
            var pagina = editProfile.createObject();
            
            pagina.nav = navigation;
            navigation.push(pagina);
        }
    }

	Page {  
        titleBar: TitleBar {
            title : qsTr("Profile")
            
            dismissAction: [
                ActionItem {
                    title: "Cancel"
                    onTriggered: {
                        sheet.close();
                    }
                }
                
            ]
            
            acceptAction: [
                
                ActionItem {
                    title: "Edit"
                    onTriggered: {
                        console.debug("BUTON WAS CLIKED")
                        var pagina = editProfile.createObject();
                        pagina.nav = navigation;
                        navigation.push(pagina);
                        
                    }
                               
                }
            ]
        }
        
        Container {
            layout: StackLayout {
            }
            horizontalAlignment: HorizontalAlignment.Center
            leftPadding: 27
            background: Color.create("#111111")
            
	        ScrollView{
                scrollViewProperties.scrollMode: ScrollMode.Vertical
				    Container {
				    	horizontalAlignment: HorizontalAlignment.Center
				        topPadding: 30	
				        Container {
                            horizontalAlignment: HorizontalAlignment.Center

					        Label {
					            id: moralLabel
					            multiline: true;
					            horizontalAlignment: HorizontalAlignment.Center
				             	text: "¡You can do it buddy!"
				             	textStyle.color: Color.White
				             }
					        ImageView {
					         id: perfilimagen
				             horizontalAlignment: HorizontalAlignment.Center
				             preferredHeight: 300
				             preferredWidth: 300
				             imageSource: mainObj.loadFoto();
				             
				             }

					        Label {
					            id: progresoLabel
					            horizontalAlignment: HorizontalAlignment.Center
				            	text: "Progress: " + progreso.value + "%    -    " + mainObj.daysLeft() + " Days left"
                                textStyle.color: Color.White
				            }
					        ProgressIndicator {
					            id: progreso
				             	 horizontalAlignment: HorizontalAlignment.Center
				             	 fromValue: 0
				             	 toValue: 100
				             	 value: mainObj.progress();
				             }
				         }
			             Container {
			                 horizontalAlignment: HorizontalAlignment.Center
			                 topPadding: 20
			                 Label {
			                     textStyle.color: Color.DarkGray
			                     text: "Name:"
			                     horizontalAlignment: HorizontalAlignment.Center
			                 }
			                 Label {
			                     id: nombre
                                 textStyle.color: Color.White
			                     horizontalAlignment: HorizontalAlignment.Center
			                     multiline: true
			                     textStyle{
			                         fontSize: FontSize.Large
			                     }
			                     text: mainObj.loadNombre();
			                 }
			             
			             }	
			            Container {
			                horizontalAlignment: HorizontalAlignment.Center
			                topPadding: 20
			                Label {
			                    textStyle.color: Color.DarkGray
			                    text: "School:"
			                    horizontalAlignment: HorizontalAlignment.Center
			                }
			                Label {
			                    id: escuela
                                textStyle.color: Color.White
			                    horizontalAlignment: HorizontalAlignment.Center
			                    multiline: true
			                    textStyle{
			                        fontSize: FontSize.Large
			                    }
			                    text: mainObj.loadEscuela();
			                }
			            
			            }	
			            Container {
			                topPadding: 20
			                layout: StackLayout {
			                    orientation: LayoutOrientation.LeftToRight
			                }
			                horizontalAlignment: HorizontalAlignment.Center
			                Container {
			                    Label {
			                        text: "Semester:"
			                        textStyle.color: Color.DarkGray
			                    }
			                    Label {
			                        id: semestre
			                        text: mainObj.loadSemestre();
                                    textStyle.color: Color.White
			                        multiline: true
			                        textStyle{
			                            fontSize: FontSize.Large
			                        }
			                    }
			                }
			                Container {
			                    leftPadding: 150
			                    Label {
			                        text: "Group:"
			                        textStyle.color: Color.DarkGray
			                    }
			                    Label {
			                        id: grupo
			                        text: mainObj.loadGrupo();
			                        multiline: true
			                        textStyle{
			                            fontSize: FontSize.Large
			                        }
                                    textStyle.color: Color.White

			                    }
			                }
			            }
			            Container {
			                horizontalAlignment: HorizontalAlignment.Center
			                topPadding: 30
			                bottomPadding: 50
			                Label {
			                    id: fechaInicialLabel
			                    horizontalAlignment: HorizontalAlignment.Center
			                    text: "Start of classes:  "  + mainObj.loadFechaInicio();
                                textStyle.color: Color.White

			                }
			                Label {
			                    id: fechafinalLabel
			                    horizontalAlignment: HorizontalAlignment.Center
			                    text: "End of classes:   " + mainObj.loadFechaFinal();
                                textStyle.color: Color.White


			                }
			            }
			            Button {
                   horizontalAlignment: HorizontalAlignment.Center
                   text: "Share"
                   onClicked: {
                       mainObj.share("WOW! just "+mainObj.daysLeft()+" days left for end of my classes , "+mainObj.progress()+"% of total. -StudyPartner")
                   }
               }
			    }
			}
	    }
        attachedObjects: [
            ComponentDefinition {
                id: editProfile
                source:"PerfilEdit.qml"
            },
            ImagePaintDefinition {
                id: backgroundLine
                imageSource: "Imagenes/Back/LineBack.amd"
                repeatPattern: RepeatPattern.XY
            }
        ]
	
	}



}