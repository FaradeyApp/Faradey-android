/*
 * Copyright (c) 2023 New Vector Ltd
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

package im.vector.app.features.home.accounts

import com.airbnb.mvrx.MavericksState
import org.matrix.android.sdk.api.session.profile.model.AccountItem

data class AccountsViewState(
        val accountItems: List<AccountItem>? = null,
        val restartApp: Boolean = false,
        val errorMessage: String? = null,
        val invalidAccount: AccountItem? = null
): MavericksState
