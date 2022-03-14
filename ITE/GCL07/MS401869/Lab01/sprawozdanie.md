# Metodyki DevOps lab01 sprawozdanie

---

## 1. Instalacja klienta GIT
Klient git był zainstalowany. Potwierdza to poniższy screen
<img src="screenshots/1_gitInstallation.png" alt="git_installation_status">

---

## 2. Klonowanie repozytorium poprzez HTTPS
<img src="screenshots/1.1_cloning_through_HTTPS.png">

---

## 3. Klonowanie repozytorium poprzez SSH
### 3.1. Generacja kluczy
**Opis parametrów**

| Opcja | Opis |
| ---   | ---  |
| `-t`  | Określa typ klucza używanego do endkrypcji i dekrypcji |
| `-b`  | W przypadku ECDSA określa rozmiar klucza poprzez wybranie rozmiaru krzywej eliptycznej |
| `-a`  | Określenie liczby rund KDF |
| `-C`  | Komentarz do klucza |
| `-f`  | lokalizacja i nazwa pary kluczy |
### 3.1.1. Generacja klucza ECDSA
<img src="screenshots/2_generatingECDSAKey_(with passphrase).png">

**Komenda użyta do generacji klucza**
```zsh
ssh-keygen -t ecdsa -b 521 -a 100 -C "Key only for task completion." -f ~/.ssh/ecdsa_key
```

### 3.1.2. Generacja klucza ed25519
<img src="screenshots/4_generating_ed25519Key_(with_passpharase).png">

**Komenda użyta do generaji klucza**
```zsh
ssh-keygen -t ed25519 -a 100 -C "This key will be used." -f ~/.ssh/ed25519_key
```

### 3.1.3. Podsumowanie operacji dodawania kluczy

<img src="screenshots/6_github_keys_summary.png">

### 3.2. Konfiguracja kluczy
**Utworzenie agenta ssh**
```zsh
eval "$(ssh-agent -s)"
```
**Dodanie klucza prywatnego ed25519 do utworzonego agenta**
```zsh
ssh-add ~/.ssh/ed25519_key
```

### 3.3. Sklonowanie repozytorium
<img src="screenshots/8_ad7+cloning.png">

---

## 4. Przełączenie się na gałąź `main`

---

## 5.Utworzenie własnej gałęzi

---

## 6. Praca na gałęzi

---

## 7. Wynkonanie pull request'a