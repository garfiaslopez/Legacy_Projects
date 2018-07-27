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

#ifndef _ACTIVITYINDICATORRECIPE_H_
#define _ACTIVITYINDICATORRECIPE_H_

#include <bb/cascades/CustomControl>

using namespace bb::cascades;

namespace bb
{
    namespace cascades
    {
        class Button;
        class ImageView;
    }
}

namespace customcs {
    class InlineActivityIndicator;
}

/* ActivityIndicatorRecipe Description:
 *
 * Simple ActivityIndicator recipe shows how a ActivityIndicator control can be used.
 *
 */
class ActivityIndicatorRecipe: public bb::cascades::CustomControl
{
    Q_OBJECT

public:
    ActivityIndicatorRecipe(Container *parent = 0);

public slots:

    /**
     * Slot function to listen to the button
     */
    void onClicked();

private:
    Button *mButton;
    ImageView* mUnbroken;
    ImageView* mBroken;
    customcs::InlineActivityIndicator* mActivityIndicator;
};

#endif // ifndef _ACTIVITYINDICATORRECIPE_H_
