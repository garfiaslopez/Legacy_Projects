import bb.cascades 1.2
import bb.cascades.pickers 1.0
import bb.system 1.2

Page {
    property variant nav
    
    titleBar: TitleBar {
        title : "Edit Profile" 
        dismissAction: [
            ActionItem {
                title: "Cancel"
                onTriggered: {
                    nav.pop();
                }
            }
        ]
        acceptAction: [
            
            ActionItem {
                title: "Save"
                onTriggered: {
                    if(nombre.text == ""||escuela.text==""||grupo.text==""||semestre.text==""){
                        errorname.show();
                    }
                    
                    else if(fechafinal.value > fechainicial.value){
                        
                        mainObj.saveNombre(nombre.text);
                        mainObj.saveEscuela(escuela.text);
                        mainObj.saveSemestre(semestre.text);
                        mainObj.saveGrupo(grupo.text);
                        mainObj.saveFechaInicio(fechainicial.value);
                        mainObj.saveFechaFinal(fechafinal.value);
                        ok.show();
                        nav.pop();
                    }
                    else 
                        errordate.show();
                }
            
            }
        ]
    
    
    }
    
    Container {
        background: Color.create("#111111")
        
        ScrollView {
            scrollViewProperties.scrollMode: ScrollMode.Vertical
                     
            Container {
                Container {
                    topPadding: 20
                    horizontalAlignment: HorizontalAlignment.Center                    
                    Label {
                        text: "Select Profile photo: \n click on the studdy buddy."
                        multiline: true
                        textStyle.color: Color.DarkGray
                        horizontalAlignment: HorizontalAlignment.Center
                        textStyle.fontSize: FontSize.Small

                    }
                    ImageView {
                        id: imagenperfil
                        horizontalAlignment: HorizontalAlignment.Center
                        preferredHeight: 300
                        preferredWidth: 300
                        imageSource: "Imagenes/ProfilePhoto.png"
                        onTouch: {
                            filePic.open();
                        }
                    }
                    Label {
                        horizontalAlignment: HorizontalAlignment.Center
                        text: "Name:"
                        textStyle.color: Color.White
                    }
                    TextField {
                        id: nombre
                        horizontalAlignment: HorizontalAlignment.Center
                        preferredWidth: 700
                        hintText: "Enter your name"
                        text: mainObj.loadNombre();
                        
                    }             
                
                }
                
                Container {
                    topPadding: 20
                    horizontalAlignment: HorizontalAlignment.Center                    
                    
                    
                    Label {
                        horizontalAlignment: HorizontalAlignment.Center
                        text: "School:"
                        textStyle.color: Color.White

                    }
                    TextField {
                        id: escuela
                        horizontalAlignment: HorizontalAlignment.Center
                        preferredWidth: 700
                        hintText: "Enter your school"
                        text: mainObj.loadEscuela();
                    
                    }             
                
                }
                Container {
                    layout: StackLayout {
                        orientation: LayoutOrientation.LeftToRight
                    }
                    horizontalAlignment: HorizontalAlignment.Center
                    
                    Container {
                        topPadding: 20
                        horizontalAlignment: HorizontalAlignment.Center                    
                        
                        
                        Label {
                            horizontalAlignment: HorizontalAlignment.Center
                            text: "Grade:"
                            textStyle.color: Color.White

                        }
                        TextField {
                            id: semestre
                            horizontalAlignment: HorizontalAlignment.Center
                            preferredWidth: 200
                            hintText: "Enter your name"
                            text: mainObj.loadSemestre();
                            }             
                    
                    }
 
                    Container {
                        leftPadding: 100
                        topPadding: 20
                        horizontalAlignment: HorizontalAlignment.Center                    
                        
                        
                        Label {
                            horizontalAlignment: HorizontalAlignment.Center
                            text: "Group:"
                            textStyle.color: Color.White

                        }
                        TextField {
                            
                            id: grupo
                            horizontalAlignment: HorizontalAlignment.Center
                            preferredWidth: 300
                            hintText: "Enter your name"
                            text: mainObj.loadGrupo();
                        
                        }             
                    
                    }      
                }
                
                Container {
                    horizontalAlignment: HorizontalAlignment.Center
                    topPadding: 30
                    DateTimePicker {
                        horizontalAlignment: HorizontalAlignment.Center
                        preferredWidth: 700
                    	id: fechainicial
                    	title: "Start of classes"
                    }
                }
                Container {
                    horizontalAlignment: HorizontalAlignment.Center
                    topPadding: 30
                    DateTimePicker {
                        horizontalAlignment: HorizontalAlignment.Center
                        preferredWidth: 700
                        id: fechafinal
                        title: "End of classes"                        
                    }
                }
                Divider {
                    
                }
            }
            
        }
        
        
    }



    attachedObjects: [
        
        FilePicker {
            id: filePic
            type : FileType.Picture
            title : "Select Profile Picture"
            sortBy: FilePickerSortFlag.Name
            viewMode: FilePickerViewMode.GridView
            //defaultType: 
            mode: FilePickerMode.Picker
            
            onFileSelected: {
                
               mainObj.saveFoto("file://" + selectedFiles[0]);
               console.debug("file://" + selectedFiles[0]);
               imagenperfil.imageSource = "file://" + selectedFiles[0];

            }
            
        },
        
        ImagePaintDefinition {
            id: backgroundLine
            imageSource: "Imagenes/Back/LineBack.amd"
            repeatPattern: RepeatPattern.XY
        },
        SystemToast {
            id: errorname
            body: "Please, fill all the fields."
        },
        SystemToast {
            id: ok
            body: "Ok, Saved."
        },
        SystemToast {
            id: errordate
            body: "The Start date must be less than the end date"
        }
    ]
}
