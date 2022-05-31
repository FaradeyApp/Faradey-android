/*
 * Copyright (c) 2022 New Vector Ltd
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package im.vector.app.features.location.live

sealed class LocationLiveMessageBannerViewState(
        open val bottomStartCornerRadiusInDp: Float,
        open val bottomEndCornerRadiusInDp: Float,
) {

    data class Emitter(
            override val bottomStartCornerRadiusInDp: Float,
            override val bottomEndCornerRadiusInDp: Float,
            val remainingTimeInMillis: Long,
            val isStopButtonCenteredVertically: Boolean
    ) : LocationLiveMessageBannerViewState(bottomStartCornerRadiusInDp, bottomEndCornerRadiusInDp)

    data class Watcher(
            override val bottomStartCornerRadiusInDp: Float,
            override val bottomEndCornerRadiusInDp: Float,
            val formattedLocalTimeOfEndOfLive: String,
    ) : LocationLiveMessageBannerViewState(bottomStartCornerRadiusInDp, bottomEndCornerRadiusInDp)
}
