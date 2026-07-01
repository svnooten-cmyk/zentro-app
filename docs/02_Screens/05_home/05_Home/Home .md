home.md
1. Doel

Home is het centrale scherm van Zentro.

De wereldkaart vormt altijd de basis van de applicatie.

De Feed ligt als Glass Sheet boven de kaart.

De gebruiker verlaat Home zo min mogelijk.

Vrijwel alle functionaliteit wordt geopend als een Universal Glass Card.

2. Referentie-afbeelding

Referentie-afbeelding: nog toevoegen

Locatie:
docs/05_Assets/Reference_Images/home_v1.png

3. Screen Structure
Home
│
├── Profile pin
│   ├── Profile Picture
│   │   ├── Tap
│   │   │   └── Edit Profile
│   │   └── Swipe
│   │       └── Switch Active Profile
│   ├── Profile Name
│   │   └── Open My About
│   │       ├── Who Am I
│   │       ├── Interests
│   │       ├── Languages
│   │       ├── Looking For
│   │       ├── Skills
│   │       └── Contact
│   ├── Country
│   ├── Slogan
│   └── Follow
│       └── Toggle Follow
│
├── Map
│   ├── Journey Route
│   │   └── Always Visible
│   ├── Content Pins
│   │   └── Controlled by Search
│   └── Current Location
│       ├── Active Profile Picture
│       └── Location Permission
│
├── Feed
│   ├── Glass Sheet
│   │   ├── 25%
│   │   ├── 50%
│   │   ├── 75%
│   │   └── 100%
│   └── Feed Cards
│       ├── Journey
│       ├── Discovery
│       └── Knowledge
│
└── Bottom pins
    ├── explore
    ├── Zentro Pin
    ├── connection pin
    ├── request pin
    └── Profile
    
4. Default Home State

selectedProfileId: activeProfileId

activeModule: Journey

activeCategory: Photos

mapMode: Fullscreen

feedMode: Glass Sheet

feedPosition: 50%

journeyRouteVisible: true

5. Firebase Data

profiles

groups

groupMembers

posts

journeyItems

discoveryItems

knowledgeItems

friends

followers

requests

notifications

profileSettings

6. Components
Header

profile_header.md

Map

map_section.md

Feed

feed_section.md

Search

search.md

Zentro Pin

zentro_pin.md

Connections

connections.md

Profile

profile.md

7. Reload Data
Active Profile Changed
Reload Data

Header

My About

Map

Feed

Search Changed
Reload Data

Map

Feed

New Content Posted
Reload Data

Map

Feed

8. Design Principles

The World Never Disappears.

De wereldkaart blijft altijd zichtbaar.

Kaart en Feed tonen altijd dezelfde dataset.

Search bepaalt welke dataset zichtbaar wordt.

De Feed ligt altijd als Glass Sheet boven de kaart.

Universal Glass Cards openen vanuit de Bottom Navigation.

Na sluiten keert de gebruiker altijd terug naar Home.

Home blijft de centrale plek van de applicatie