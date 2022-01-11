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

package im.vector.app.features.home.room.detail.timeline.style

import android.os.Parcelable
import im.vector.app.R
import kotlinx.parcelize.Parcelize

sealed interface TimelineMessageLayout : Parcelable {
    val layoutRes: Int
    val showAvatar: Boolean
    val showDisplayName: Boolean
    val showTimestamp: Boolean

    @Parcelize
    data class Modern(override val showAvatar: Boolean,
                      override val showDisplayName: Boolean,
                      override val showTimestamp: Boolean,
                      override val layoutRes: Int = R.layout.item_timeline_event_base) : TimelineMessageLayout

    @Parcelize
    data class Bubble(override val showAvatar: Boolean,
                      override val showDisplayName: Boolean,
                      override val showTimestamp: Boolean = true,
                      val isIncoming: Boolean,
                      val isFirstFromThisSender: Boolean,
                      val isLastFromThisSender: Boolean,
                      override val layoutRes: Int = if (isIncoming) R.layout.item_timeline_event_bubble_incoming_base else R.layout.item_timeline_event_bubble_outgoing_base,
    ) : TimelineMessageLayout
}
