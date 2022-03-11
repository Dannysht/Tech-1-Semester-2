#1
SELECT * FROM tmember WHERE cName = 'Jens S.' AND dBirth < '1970-01-01' AND dNewMember >= '2013-01-01' AND dNewMember < '2014-01-01';
#2
SELECT * FROM tbook WHERE nPublishingCompanyID NOT IN (15, 32) OR (nPublishingCompanyID IN (15, 32) AND nPublishingYear < 2000);
#3
SELECT cName FROM tmember WHERE cPhoneNo IS NOT NULL AND cAddress IS NULL;
#4
SELECT * FROM tauthor WHERE cSurname = 'Byatt' AND cName LIKE 'A%' AND cName LIKE '%S%';
#5
SELECT COUNT(nBookID) AS numberOfBooks FROM tbook WHERE nPublishingYear = 2007 AND nPublishingCompanyID = 32;
#6
SELECT dLoan, COUNT(cSignature) AS numberOfBooks FROM tloan WHERE cCPR = '0305393207' AND (dLoan >= '2014-1-1' AND dLoan < '2015-1-1') GROUP BY dLoan;
#7
SELECT dLoan, COUNT(cSignature) AS numberOfBooks FROM tloan WHERE cCPR = '0305393207' AND (dLoan >= '2014-1-1' AND dLoan < '2015-1-1') GROUP BY dLoan  HAVING COUNT(cSignature) > 1;
#8
SELECT * FROM tmember ORDER BY dNewMember DESC, cName ASC, cSurname ASC;
#9
SELECT cTitle, cName FROM tbook, ttheme, tbooktheme WHERE nPublishingCompanyID = 32 AND (tbook.nBookID = tbooktheme.nBookID AND tbooktheme.nThemeID = ttheme.nThemeID);
#10
SELECT cName, cSurname, COUNT(tauthorship.nBookID)  AS booksWritten FROM tauthor, tbook, tauthorship WHERE (tauthorship.nAuthorID = tauthor.nAuthorID) AND tauthorship.nBookID = tbook.nBookID GROUP BY cName, cSurname;
#11

#12
SELECT cTitle, cName, cSurname FROM tauthor, tbook, tloan WHERE ;

#13.9
SELECT tbook.cTitle, ttheme.cName FROM ((tbook
    INNER JOIN tbooktheme ON tbook.nBookID = tbooktheme.nBookID)
                                           INNER JOIN ttheme ON ttheme.nThemeID = tbooktheme.nThemeID)
WHERE tbook.nPublishingCompanyID = 32;

#13.10
SELECT COUNT(cTitle), cName, cSurname
FROM ((tbook
    INNER JOIN tauthorship ON tbook.nBookID = tauthorship.nBookID)
         INNER JOIN tauthor ON tauthor.nAuthorID = tauthorship.nAuthorID)
WHERE cTitle IS NOT NULL
GROUP BY cName, cSurname;

#13.11
SELECT cName, cSurname, MIN(nPublishingYear) FROM ((tauthor
INNER JOIN tauthorship ON tauthorship.nAuthorID = tauthor.nAuthorID)
INNER JOIN tbook ON tbook.nBookID = tauthorship.nBookID)
GROUP BY cName, cSurname;

#13.12
SELECT tloan.cSignature AS book_signature,
tloan.dLoan AS loan_date,
tbook.cTitle AS book_title,
tmember.cName, tmember.cSurname FROM ((tloan
INNER JOIN tbookcopy ON tloan.cSignature = tbookcopy.cSignature)
INNER JOIN tmember ON tloan.cCPR = tmember.cCPR)
INNER JOIN tbook ON tbook.nBookID = tbookcopy.nBookID;

#14 not done
SELECT cName, cTitle FROM  tbook, ttheme LEFT JOIN tbooktheme t on ttheme.nThemeID = t.nThemeID
WHERE (t.nThemeID IS NULL OR t.nThemeID IS NOT NULL) AND tbook.nBookID = t.nBookID ORDER BY cName;

#15
SELECT cName, cSurname, cTitle FROM tmember, tbook, tbookcopy, tloan
WHERE tbook.nBookID = tbookcopy.nBookID
AND tbookcopy.cSignature = tloan.cSignature
AND tloan.cCPR = tmember.cCPR
AND dNewMember BETWEEN '2013-01-01' AND '2013-12-31'
AND dLoan BETWEEN '2013-01-01' AND '2013-12-31'
ORDER BY cName, cSurname;

#16
SELECT tauthor.cName, tauthor.cSurname, tcountry.cName, if(tauthor.nAuthorID <> tauthorship.nBookID, tbook.cTitle, '') AS TITLE
FROM tauthor
INNER JOIN tnationality ON tauthor.nAuthorID = tnationality.nAuthorID
INNER JOIN tcountry ON tnationality.nCountryID = tcountry.nCountryID
INNER JOIN tauthorship ON tauthor.nAuthorID = tauthorship.nAuthorID
INNER JOIN tbook ON tauthorship.nBookID = tbook.nBookID
ORDER BY  tauthor.cName, cSurname;

#17
SELECT book1.cTitle AS 'Books with releases in 1970 and 1989' FROM tbook book1, tbook book2
WHERE book1.cTitle = book2.cTitle AND book1.nPublishingYear = 1970
AND book2.nPublishingYear = 1989;

#18
SELECT Names FROM(
SELECT DISTINCT CONCAT(library.tmember.cSurname, ' ', library.tmember.cName) AS 'Names'
FROM tmember WHERE dNewMember BETWEEN '2013-12-1' AND '2013-12-31'
UNION ALL
SELECT
CONCAT(tauthor.cName, ' ', tauthor.cSurname) AS 'Authors named William'
FROM tauthor WHERE cName = 'William') AS SUB;

#19
SELECT cName, cSurname FROM tmember ORDER BY dNewMember ASC LIMIT 1;

#20

#21
SELECT tpublishingcompany.cName AS Name, tcountry.cName AS Country FROM tpublishingcompany, tcountry
WHERE tpublishingcompany.nCountryID = tcountry.nCountryID;

#22
SELECT cTitle FROM tbook
WHERE nPublishingYear BETWEEN '1926' AND '1978'
  AND nPublishingCompanyID NOT IN ('32');

#23
SELECT cName, cSurname FROM tmember
WHERE dNewMember > '2016-01-01'
AND cAddress IS NULL;

#24
SELECT DISTINCT tcountry.nCountryID FROM tcountry, tpublishingcompany
WHERE tpublishingcompany.nCountryID = tcountry.nCountryID

#25
SELECT cTitle FROM tbook
WHERE cTitle LIKE 'The Tale%'
AND nPublishingCompanyID NOT IN ('13');

#26
SELECT DISTINCT ttheme.cName FROM ttheme, tpublishingcompany, tbooktheme, tbook
WHERE tpublishingcompany.cName = 'Lynch Inc'
AND tpublishingcompany.nPublishingCompanyID = tbook.nPublishingCompanyID
AND tbook.nBookID = tbooktheme.nBookID
AND tbooktheme.nThemeID = ttheme.nThemeID;

#27
SELECT DISTINCT cTitle FROM tbook
WHERE nBookID NOT IN (SELECT nBookID FROM tbookcopy
WHERE cSignature IN(SELECT cSignature FROM tloan WHERE tloan.cSignature
IS NOT NULL));


#28
SELECT cName, COUNT(tbook.nPublishingCompanyID) AS 'No. of Books'
FROM tbook, tpublishingcompany
WHERE tbook.nPublishingCompanyID = tpublishingcompany.nPublishingCompanyID
GROUP BY cName;

#29
SELECT COUNT(cCPR) AS 'Member who took a book in 2013' FROM tloan
WHERE dLoan BETWEEN '2013-01-01' AND '2013-12-31';

#30
SELECT cTitle, COUNT(tauthor.nAuthorID) AS 'No. of Authors'
FROM tbook, tauthor, tauthorship
GROUP BY cTitle HAVING 'No. of Authors' >= 2;




