profile_header.md
## 1. Doel

Toont de actieve profielinformatie van het geselecteerde profiel.
Alle gegevens zijn gekoppeld aan selectedProfileId.
Wanneer selectedProfileId wijzigt, wordt de volledige Profile Header vernieuwd.

## 2. Referentie-afbeelding

Referentie-afbeelding: nog toevoegen

## 3. Active Profile Logic

Iedere gebruiker start met een soloProfile.

Ondersteunde profieltypen:
soloProfile
childProfile
groupProfile

Een groupProfile is een samenvoeging van één of meerdere soloProfiles en childProfiles.

Het actieve profiel wordt bepaald door:
selectedProfileId

Bij wijziging van selectedProfileId wordt de volledige Profile Header vernieuwd.

## 4. Firebase Data

profiles
groups
groupMembers
followers
countries

## 5. State

selectedProfileId
selectedGroupId
activeProfileType
isOwnProfile
followStatus

## 6. UI Blocks
# BannerImage
Firebase:
    profiles.bannerImage
    groups.bannerImage

Refresh:
    selectedProfileId

Edit:
    home_edit.md

# ProfilePicture
Firebase:
    profiles.profileImage
    groups.profileImage

Refresh:
    selectedProfileId

Edit:
    home_edit.md

# ProfileName
Firebase:
    profiles.displayName
    groups.groupName

Refresh:
    selectedProfileId

Edit:
    home_edit.md
# CountryFlag
Firebase:
    profiles.countryCode
    groups.countryCode

Refresh:
    selectedProfileId

Edit:
    home_edit.md
# ProfileSlogan
Firebase:
    profiles.slogan
    groups.groupSlogan

Refresh:
    selectedProfileId

# Edit:
    home_edit.md
EditButton
On Tap:
    Open home_edit.md

# Bewerkbare onderdelen:
    BannerImage
    ProfilePicture
    ProfileName
    ProfileSlogan
    Country
    AboutMe

# FollowButton
Zichtbaar:
    Alleen bij andere profielen

Firebase:
    followers

On Tap:
    Toggle Follow

# MembersDropdown
Type:
    Dropdown Button

Badge:
    groupMembers.count

Inhoud:
    soloProfiles
    childProfiles
    groupProfile
    Add+

On Select:
    selectedProfileId = gekozenProfileId

Refresh:
    Complete Home Screen
      
# Add+
Opties:
    Create New Solo Account
    Add Existing Solo Profile
    Create Child Profile
Create New Solo Account
Open:
    signup.md

Resultaat:
    Nieuw soloProfile
Add Existing Solo Profile
Zoek op:
    ProfileName
    ProfileCode

Na acceptatie:
    Voeg profiel toe aan groupMembers
    Maak of update groupProfile
Create Child Profile
Open:
    child_profile.md

Resultaat:
    Nieuw childProfile
    Automatisch gekoppeld aan ownerProfileId
FollowersButton
Badge:
    followers.count

On Tap:
    Open followers.md
AboutMeButton
On Tap:
    Open about_me.md
# 7. Permissions

Eigen profiel
Ander profiel
Child profiel
Group profiel

8. Refresh Rules

Bij wijziging van selectedProfileId:
Refresh Profile Header
Refresh About Me
Refresh Feed
Refresh Map
Refresh Journey
Refresh Permissions

9. Later

Verified Badge
Travel Statistics
Pinned Journey
Profile Theme


