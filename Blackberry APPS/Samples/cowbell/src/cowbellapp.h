/* Copyright (c) 2012 Research In Motion Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#ifndef COWBELLAPP_H
#define COWBELLAPP_H

#include <bb/cascades/Application>
#include "soundmanager.h"

/**
 * CowBellApp Description:
 *
 * This sample illustrates how a simple toy instrument can be built using
 * Cascades. As the user hits a cowbell image in different places, a sound
 * is triggered with different volumes. A transform rotation is applied to 
 * give the illusion of the bell hanging around the neck of a cow.
 */
class CowBellApp: public QObject
{
Q_OBJECT

public:

  // This is our constructor to setup our cowbell application
  CowBellApp();

  // This is our destructor that frees the memory of the sound manager
  ~CowBellApp();

  /**
   * This Invokable function is used for triggering sounds from the QML file.
   * @param msg A string describing which sound should be played
   */
  Q_INVOKABLE
  void playSound(const QString &msg);

private:
  // The sound manager
  SoundManager *mSoundManager;

};

#endif // ifndef COWBELLAPP_H
