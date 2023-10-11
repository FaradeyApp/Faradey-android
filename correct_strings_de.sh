#!/bin/bash

# Don't call this script directly, but from correct_strings.sh!
# It is a separated file for easier dynamic patching

# Replace known forms with easier grep-able ones:
sed -i 's|!nnen|wolpertinger|g' "$strings_de"
sed -i 's|[/:*]innen|wolpertinger|g' "$strings_de"
sed -i 's|!n|schlumpfwesen|g' "$strings_de"
sed -i 's|[/:*]in|schlumpfwesen|g' "$strings_de"
sed -i 's|\([a-zäöüß]\)[/:*]r|\1rschlumpfwesen|g' "$strings_de"
# Automated manual intervention:
sed -i 's|da der/die Benutzerschlumpfwesen dasselbe Berechtigungslevel wie du erhalten wirst|da der Benutzer dasselbe Berechtigungslevel wie du erhalten wird|g' "$strings_de"
sed -i 's|des/der anderen Nutzerschlumpfwesen|der anderen Nutzer|g' "$strings_de"
sed -i 's|Nur du und der/die Empfängerwolpertinger haben die Schlüssel um|Nur du und der/die Empfänger haben die Schlüssel, um|g' "$strings_de"
sed -i 's|Nur du und der/die Empfängerschlumpfwesen haben|Nur du und der Empfänger haben|g' "$strings_de"
sed -i 's|kann ein/e Angreiferschlumpfwesen versuchen auf|kann ein Angreifer versuchen, auf|g' "$strings_de"
sed -i 's|wenn du dem/r Besitzerschlumpfwesen|wenn du dem Besitzer|g' "$strings_de"
sed -i 's|Nur für Entwicklerwolpertinger|Nur für Entwickler|g' "$strings_de"
sed -i 's|Verifiziere diese/n Benutzerschlumpfwesen|Verifiziere diesen Benutzer|g' "$strings_de"
sed -i 's|dass ein/e Benutzerschlumpfwesen vertrauenswürdig ist|dass ein Benutzer vertrauenswürdig ist|g' "$strings_de"
sed -i 's|"room_member_power_level_users">Nutzerschlumpfwesen<|"room_member_power_level_users">Nutzer<|g' "$strings_de"
sed -i 's|andere Benutzerwolpertinger sehen|andere Benutzer sehen|g' "$strings_de"
sed -i 's|Andere Benutzerwolpertinger vertrauen|Andere Benutzer vertrauen|g' "$strings_de"
sed -i 's|wird den/die Benutzerschlumpfwesen von diesem Raum ausschließen|wird den Benutzer von diesem Raum ausschließen|g' "$strings_de"
sed -i 's|Um einen erneuten Beitritt zu verhindern, solltest du ihn/sie|Um einen erneuten Beitritt zu verhindern, solltest du ihn|g' "$strings_de"
sed -i 's|\(Du wirst ohne .* und vertraute\) Nutzerwolpertinger neu starten|\1 Nutzer neu starten|g' "$strings_de"
sed -i 's|Der Identitätsserver den|Der Identitätsserver, den|g' "$strings_de"
sed -i 's|aktuelle Sitzung gehört dem/der Benutzerschlumpfwesen%|aktuelle Sitzung gehört %|g' "$strings_de"
sed -i 's|sind von Benutzerschlumpfwesen|sind von|g' "$strings_de"
sed -i 's|Vertraue allen Benutzerwolpertinger|Vertraue allen Benutzern|g' "$strings_de"
sed -i 's|Bis diese/r Benutzerschlumpfwesen \(.*\) werden an und von ihr/ihm|Bis dieser Benutzer \1 werden an und von ihm|g' "$strings_de"
sed -i 's|gelöscht vom Benutzerschlumpfwesen|gelöscht vom Benutzer|g' "$strings_de"
sed -i 's|Nutzerschlumpfwesen hinzufügen|Nutzer hinzufügen|g' "$strings_de"
sed -i 's|von anderen Nutzenden|von anderen Nutzern|g' "$strings_de"
sed -i 's|Bekannte Nutzerwolpertinger|Bekannte Nutzer|g' "$strings_de"
sed -i 's|%d Benutzerwolpertinger<|%d Benutzer<|g' "$strings_de"
sed -i 's|%d Benutzerschlumpfwesen<|%d Benutzer<|g' "$strings_de"
sed -i 's|Zum/r normalen Benutzerschlumpfwesen herabstufen|Zum normalen Benutzer herabstufen|g' "$strings_de"
sed -i 's|frage den/die Administratorwolpertinger|frage den Administrator|g' "$strings_de"
sed -i 's|frage den/die Administratorschlumpfwesen|frage den Administrator|g' "$strings_de"
sed -i 's|Bitte den/die Administratorwolpertinger|Bitte den Administrator|g' "$strings_de"
sed -i 's|Bitte den/die Administratorschlumpfwesen|Bitte den Administrator|g' "$strings_de"
sed -i 's|keine weiteren Inhalte dieses/r Nutzersschlumpfwesen sehen|keine weiteren Inhalte dieses Nutzers sehen|g' "$strings_de"
sed -i 's|gelöscht von Benutzerschlumpfwesen,|gelöscht vom Benutzer,|g' "$strings_de"
sed -i 's|Aktivieren Ende-zu-Ende-Verschlüsselung|Ende-zu-Ende-Verschlüsselung aktivieren|g' "$strings_de"
sed -i 's|Nachrichten dieses/r Nutzersschlumpfwesen|Nachrichten dieses Nutzers|g' "$strings_de"
sed -i 's|Ausschluss eines/r Nutzersschlumpfwesen|Ausschluss eines Nutzers|g' "$strings_de"
sed -i 's|Erwähnen eines/r Nutzersschlumpfwesen|Erwähnen eines Nutzers|g' "$strings_de"
sed -i 's|Nachrichten des/r Nutzersschlumpfwesen|Nachrichten des Nutzers|g' "$strings_de"
sed -i 's|Nutzerschlumpfwesen \([einladen\|entfernen\|verbannen\|filtern\|ignorieren]\)|Nutzer \1|g' "$strings_de"
sed -i 's|Nutzerwolpertinger \([einladen\|entfernen\|verbannen\|filtern\|ignorieren]\)|Nutzer \1|g' "$strings_de"
sed -i 's|>Nutzerwolpertinger<|>Nutzer<|g' "$strings_de"
sed -i 's|von einem Nutzerschlumpfwesen|von einem Nutzer|g' "$strings_de"
sed -i 's|von %d Nutzerwolpertinger|von %d Nutzern|g' "$strings_de"
sed -i 's|ignorierst keine Nutzerwolpertinger|ignorierst keine Nutzer|g' "$strings_de"
sed -i 's|Prüfe die Nutzerschlumpfwesen,|Prüfe die Nutzer,|g' "$strings_de"
sed -i 's|Sitzungen von anderen Nutzerwolpertinger|Sitzungen von anderen Nutzern|g' "$strings_de"
sed -i 's|sodass <b>einige Nutzerwolpertinger sich|sodass <b>einige Nutzer sich|g' "$strings_de"
sed -i 's|für zukünftige Nutzerwolpertinger|für zukünftige Nutzer|g' "$strings_de"
sed -i 's|registrierte Nutzerwolpertinger, die|registrierte Nutzer, die|g' "$strings_de"
sed -i 's|Bestätigung des/r anderen Nutzerschlumpfwesen|Bestätigung des anderen Nutzers|g' "$strings_de"
sed -i 's|Benutzerschlumpfwesen per ID einladen|Benutzer per ID einladen|g' "$strings_de"
sed -i 's|Bannt Benutzerschlumpfwesen mit angegebener ID|Bannt Benutzer mit angegebener ID|g' "$strings_de"
sed -i 's|Lädt Benutzerschlumpfwesen mit angegebener Kennung in den aktuellen Raum ein|Lädt Benutzer mit angegebener Kennung in den aktuellen Raum ein|g' "$strings_de"
sed -i 's|Kickt Benutzerschlumpfwesen mit angegebener ID|Kickt Benutzer mit angegebener ID|g' "$strings_de"
sed -i 's|Lasse andere Benutzerwolpertinger wissen, dass du tippst.|Lasse andere Benutzer wissen, dass du tippst.|g' "$strings_de"
sed -i 's|Wenn ein:e Benutzerschlumpfwesen ein abgestecktes Gerät mit ausgeschaltetem Bildschirm eine Weile nicht bewegt, wechselt es in den Bereitschaftsmodus.|Wenn ein Benutzer ein abgestecktes Gerät mit ausgeschaltetem Bildschirm eine Weile nicht bewegt, wechselt es in den Bereitschaftsmodus.|g' "$strings_de"
sed -i 's|Google sagt, dass dieses Gerät zu viele Apps registriert hat um FCM zu nutzen|Google sagt, dass dieses Gerät zu viele Apps registriert hat, um FCM zu nutzen|g' "$strings_de"
sed -i 's|Er sollte also den/die Durchschnittsnutzerschlumpfwesen nicht betreffen|Er sollte also den Durchschnittsnutzer nicht betreffen|g' "$strings_de"
sed -i 's|Sichere Nachrichten mit diesem/r Benutzerschlumpfwesen|Sichere Nachrichten mit diesem Benutzer|g' "$strings_de"
sed -i 's|Der/die Benutzerschlumpfwesen hat|Der Benutzer hat|g' "$strings_de"
sed -i 's|Ereignis von Benutzerschlumpfwesen gelöscht|Ereignis vom Benutzer gelöscht|g' "$strings_de"
sed -i 's|andere Benutzerwolpertinger werden ihm nicht vertrauen|andere Benutzer werden ihm nicht vertrauen|g' "$strings_de"
sed -i 's|verifiziere Benutzerwolpertinger|verifiziere Benutzer|g' "$strings_de"
sed -i 's|Benutzerwolpertinger werden eingeladen|Benutzer werden eingeladen|g' "$strings_de"
sed -i 's|Benutzerwolpertinger einladen|Benutzer einladen|g' "$strings_de"
sed -i 's|Wir konnten die Benutzerwolpertinger nicht einladen|Wir konnten die Benutzer nicht einladen|g' "$strings_de"
sed -i 's|Bitte überprüfe die Benutzerwolpertinger|Bitte überprüfe die Benutzer|g' "$strings_de"
sed -i 's|nur mit einem/r anderen berechtigten Benutzerschlumpfwesen|nur mit einem anderen berechtigten Benutzer|g' "$strings_de"
sed -i 's|Benutzerschlumpfwesen ignorieren|Benutzer ignorieren|g' "$strings_de"
sed -i 's|die Einladung für diese:n Benutzerschlumpfwesen zurückziehen|die Einladung für diesen Benutzer zurückziehen|g' "$strings_de"
sed -i 's|Benutzerschlumpfwesen entfernen|Benutzer entfernen|g' "$strings_de"
sed -i 's|Benutzerschlumpfwesen bannen|Benutzer bannen|g' "$strings_de"
sed -i 's|dem/r Benutzerschlumpfwesen erlauben|dem Benutzer erlauben|g' "$strings_de"
sed -i 's|erlauben dem Raum wieder beizutreten|erlauben, dem Raum wieder beizutreten|g' "$strings_de"
sed -i 's|Moderatorschlumpfwesen|Moderator|g' "$strings_de"
sed -i 's|Zum/r Moderatorschlumpfwesen machen|Zum Moderator machen|g' "$strings_de"
sed -i 's|Wenn der/die Server-Administratorschlumpfwesen dir mitgeteilt hat|Wenn der Server-Administrator dir mitgeteilt hat|g' "$strings_de"
sed -i 's|dass der Fingerabdruck unten mit dem von deinem/r Administratorschlumpfwesen bereitgestellten übereinstimmt|dass der Fingerabdruck unten mit dem von deinem Administrator bereitgestellten übereinstimmt|g' "$strings_de"
sed -i 's|wenn der/die Server-Administratorschlumpfwesen einen Fingerprint veröffentlicht hat|wenn der Server-Administrator einen Fingerprint veröffentlicht hat|g' "$strings_de"
sed -i 's|Dein:e Serveradministratorschlumpfwesen hat|Dein Serveradministrator hat|g' "$strings_de"
sed -i 's|%1$s, %2$s, %3$s und %4$d andererschlumpfwesen|%1$s, %2$s, %3$s und %4$d anderer|g' "$strings_de"
sed -i 's|Jederschlumpfwesen|Jeder|g' "$strings_de"
sed -i 's|jederschlumpfwesen|jeder|g' "$strings_de"
sed -i 's|Ignorieren einiger Benutzerwolpertinger|Ignorieren einiger Benutzer|g' "$strings_de"
