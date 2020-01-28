AIC és BIC kritérium tesztelése

Az elemzési kérdésé az, hogy az AIC és BIC alapú modellkiválasztás függ-e az ARMA modell komplexitásától? A szimuláció során a feladat több ARMA DGP legenerálása egy adott zajszint és mintaelemszám mellett.
A szimuláció felépítése:
1.	A modell paramétereinek a megadása
2.	data generating process, vagyis zajos idősor legenerálás
3.	ARMA modell illesztése
4.	AIC és BIC kritérium tesztelése
5.	Egy eredménytáblázatba a relatív gyakoriságok megjelenítése, tehát az, hogy melyik választja ki többszöri futtatás után gyakrabban az össz elemszámhoz viszonyítva

A szimuláció leírása:
A paraméterek definiálása során megadom, hogy milyen hosszú idősort generáljon (N), azt, hogy mennyi alkalommal futtassa le a szimulációt (rn), valamint az ARMA folyamatban a konstansokat, külön az AR és MA folyamatokra.
Zajos idősort generálok, aminek az első folyamata az ARMA(1,1), majd ARMA(1,2), ARMA(1,3), ARMA(2,1)…ARMA(3,3(, tehát kilenc féle zajos ARMA folyamatot generálok. Ezután megnézem, hogy az ARMA (0,1) …ARMA(3,3) folyamatok melyikének a legkisebb az AIC és BIC kritériuma, miután a generált adatsorra illesztettem. Az elemzés utolsó lépéseként az eredményeket egy táblázatba gyűjtöm, ahol az egyes ARMA modellek mellett megjelenik, hogy hányszor találták meg az egyes kritériumok alapján. Az eredmények relatív gyakoriságként szerepelnek.
Az eredménytáblázatban található eredményekhez a sigma2-et 1, nek választottam meg, és 50-szer futtattam az elemzést egy-egy 100 hosszúságú idősorra. Az autoregresszív folyamat konstansainak változatlansága mellet a mozgóátlag folyamat konstansainak kismértékű megváltoztatásával egészen más eredményeket kaptam (2. Táblázat), így utóbbi esetben a legtöbb ARMA folyamatra egyik kritérium se járt eredménnyel. 
A szimulációt elvégeztem egy olyan módosítással, amiben a generált zajos ARMA folyamathoz illesztett modell is csak ARMA(1,1), ARMA(1,2)…ARMA(3,3) lehet, vagyis, amiben autoregresszív, vagy mozgóátlagos tag nem szerepel azokat kihagytam, ezzel a módosítással sokkal jobb eredményeket kaptam (3. Táblázat). A módosítás eléréséhez a paraméterek között lehet választani m-et 1-nek, ez az érték eredetileg 0 volt.
Az eredmény táblázatok legvégén láthatóak. A szimulációt R-ben írtam meg. Az elemzés kiegészíthető ellenőrző metódusokkal abból a célból, hogy a rossz paramétereket kiszűrjük elemzés előtt és hibaüzenetet küldjünk.
Összességében az AIC kritérium egyszerőbb és bonyolultabb esetekben is jobban teljesített az eredeti szimulációban, a módosított esetben pedig az egyszerűbb ARMA folyamatokat a BIC kritétium találja meg nagyobb arányban. 

1.	Táblázat
A táblázatokban található eredményekhez az elemzésben szereplő paraméterek és az alábbi konstansok szerepelnek:
Az autoregresszív (AR) folyamat konstansai: 
•	AR(1): 0.1
•	AR(2): 0.1,0.1
•	AR(1): 0.1,0.1,0.1
A mozgóátlag (MA) folyamat konstansai: 
•	MA(1): 0.1
•	MA(2):, -0.3,0.3
•	MA(3): -0.5,0.5,0.5

ARMA	AIC	BIC
11	0.00	0.00
12	0.04	0.00
13	0.12	0.04
21	0.02	0.00
22	0.10	0.04
23	0.10	0.02
31	0.00	0.00
32	0.06	0.00
33	0.04	0.00

2.	Táblázat
Az autoregresszív (AR) folyamat konstansai: 
•	AR(1): 0.1
•	AR(2): 0.1,0.1
•	AR(1): 0.1,0.1,0.1
A mozgóátlag (MA) folyamat konstansai: 
•	MA(1): 0.1
•	MA(2):, -0.3,0.3
•	MA(3): -0.3,0.5,0.5
ARMA
ARMA	AIC	BIC
11	0.0	0.2
12	0.0	0.0
13	0.0	0.0
21	0.0	0.0
22	0.0	0.0
23	0.0	0.0
31	0.2	0.0
32	0.0	0.0
33	0.0	0.0

3.	Táblázat
ARMA	AIC	BIC
11	0.24	0.78
12	0.28	0.38
13	0.60	0.58
21	0.04	0.04
22	0.10	0.06
23	0.12	0.02
31	0.02	0.02
32	0.02	0.00
33	0.04	0.02



