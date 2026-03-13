# Proiect_JSP

# Administrare Formații Muzicale – JSP & MySQL

## Descriere

Această aplicație web este dezvoltată utilizând tehnologia **JSP (JavaServer Pages)** și o bază de date **MySQL**. Aplicația permite gestionarea informațiilor despre formații muzicale, membri și contracte, oferind utilizatorului posibilitatea de a efectua operații **CRUD (Create, Read, Update, Delete)** asupra datelor.

Sistemul este structurat astfel încât să separe logica aplicației de interfața utilizatorului și de baza de date, oferind o arhitectură clară și ușor de întreținut.

---

## Tehnologii utilizate

- Java
- JSP (JavaServer Pages)
- MySQL
- HTML
- CSS
- JDBC

---

## Structura bazei de date

Baza de date conține trei tabele principale:

### formatii
- idformatie (Primary Key)
- nume
- gen_muzical
- an_infiintare

### membri
- idmembru (Primary Key)
- nume
- varsta
- instrument

### contract
- id (Primary Key)
- idformatie (Foreign Key)
- idmembru (Foreign Key)
- data_inceput
- data_sfarsit
- status_contract

Relația dintre tabelele **formatii** și **membri** este de tip **Many-to-Many (M:N)** și este realizată prin tabela **contract**.

---

## Funcționalități

Aplicația permite utilizatorului să efectueze următoarele operații asupra bazei de date:

### Vizualizare
- afișarea datelor existente în tabele

### Adăugare
- introducerea de noi înregistrări în baza de date

### Modificare
- actualizarea informațiilor existente

### Ștergere
- eliminarea înregistrărilor din baza de date

---

## Structura proiectului

Proiectul conține următoarele componente principale:

### db
Conține clasa **JavaBean.java**, responsabilă pentru:
- conectarea la baza de date
- executarea interogărilor SQL
- manipularea datelor din tabele

### webapp
Conține toate paginile JSP ale aplicației:

- vizualizareFormatii.jsp
- vizualizareMembri.jsp
- vizualizareContracte.jsp
- adaugaFormatie.jsp
- adaugaMembru.jsp
- adaugaContract.jsp
- stergeFormatie.jsp
- stergeMembru.jsp
- stergeContract.jsp
- modificaFormatie.jsp
- modificaMembru.jsp
- modificaContract.jsp

### index.html
Reprezintă pagina principală a aplicației, care oferă acces la toate operațiile disponibile.

---

## Interfața grafică

Interfața aplicației este realizată folosind **HTML și CSS**, iar paginile dinamice sunt implementate cu **JSP**.

Pagina principală funcționează ca un **dashboard** care oferă acces rapid la operațiile principale:

- Vizualizare
- Adăugare
- Modificare
- Ștergere

Designul utilizează un layout modern bazat pe **grid**, cu elemente stilizate folosind CSS, incluzând efecte vizuale precum umbre, colțuri rotunjite și animații la hover pentru butoane.

---

## Cum se rulează aplicația

1. Instalează **Java JDK**
2. Instalează **Apache Tomcat**
3. Instalează **MySQL**
4. Creează baza de date și tabelele necesare
5. Configurează conexiunea la baza de date în clasa `JavaBean`
6. Rulează aplicația pe serverul Tomcat

---

## Autor

**Alexia Ioana Nedelcu**  
Universitatea POLITEHNICA București  
Facultatea de Electronică, Telecomunicații și Tehnologia Informației
