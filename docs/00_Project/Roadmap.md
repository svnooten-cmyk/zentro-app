Architecture
Doel

Dit document beschrijft de technische architectuur van Zentro.

Alle technische keuzes binnen het project moeten aansluiten op deze architectuur.

Architectuur

Zentro bestaat uit drie hoofdonderdelen:

Flutter (Frontend)
Firebase (Backend)
Python / FastAPI (AI & Server)
Frontend

Framework

Flutter
Dart

Verantwoordelijkheden

UI
Navigatie
Animaties
Kaartweergave
Gebruikersinteractie
Communicatie met Firebase
Communicatie met FastAPI
Backend

Firebase verzorgt:

Authentication
Firestore
Storage
Security Rules
Push Notifications (later)
AI & Server

Python / FastAPI verzorgt later:

AI-samenvattingen
Vertalingen
Aanbevelingen
Route-analyse
Moderatie
Zoekfunctionaliteit
Bouwvolgorde
Markdown
Flutter
Firebase
Testen
Python
AI
Optimalisatie
Flutter structuur
lib/
├── models/
├── screens/
├── services/
├── widgets/
└── main.dart
Documentatie

Alle documentatie staat in:

docs/
Assets

Alle afbeeldingen staan in:

assets/
Ontwikkelregels
Markdown eerst.
Daarna pas code.
Eén scherm tegelijk.
Eén compleet Flutter-scherm per oplevering.
Eerst dummydata.
Daarna Firebase.
Geen AI voordat de basis volledig werkt.
Single Source of Truth

De Markdown-documenten in /docs zijn de officiële projectdocumentatie.

Alleen goedgekeurde wijzigingen worden hierin verwerkt.