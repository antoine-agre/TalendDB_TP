# TP Architecture de services
> Antoine AGRÉ - 5A INSA ICy

## Base de données

Ce projet manipule une base de données PostgreSQL.

- **Nom de la DB :** `Users`
- **Nom de la table :** `User`

### Schéma de la table `User`

```sql
Users=# CREATE TABLE "User" (
Users(#         id      serial PRIMARY KEY,
Users(#         nom     varchar(50) NOT NULL,
Users(#         prenom  varchar(50) NOT NULL,
Users(#         login   varchar(30),
Users(#         password        varchar(30)
Users(# );
```

## Flux

### Consommation de fichiers CSV
> Job `CSV_Import 0.1`

Ce job consomme des fichiers CSV dans le répertoire indiqué dans le paramètre `Directory` du composant `tFileList`, et crée les utilisateurs qu'ils contiennent dans la base de données.

**Format des fichiers :**
```csv
nom1,prenom1,login1,password1
nom2,prenom2,login2,password2
```

### API REST de création d'utilisateurs (POST)
> Job `REST_API_Create_User 0.1`

Ce job crée une API REST qui attends des requêtes de type POST pour créer des utilisateurs dans la base de données.

**Format des requêtes :**

```json
{
	"nom": "Raffarin",
	"prenom": "Jean-Pierre"
}
```

Les espaces sont retirés avant et après les champs. Un login et un mot de passe sont créés par le système.

Il est possible de créer un seul utilisateur par requête.

### API SOAP d'interrogation de la DB
> Jobs `SOAP_WS_Get_User 0.1` et `SOAP_WS_Get_User_By_Login 0.1`

Ce job crée une API SOAP qui attends des requêtes contenant un login (`SOAP_WS_Get_User_By_Login`) ou un id (`SOAP_WS_Get_User`), et leur retourne l'utilisateur correspondant.

**Format des requêtes :**

```xml
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ser="http://www.talend.org/service/">
   <soapenv:Header/>
   <soapenv:Body>
      <ser:GetUserByLoginWSOperationRequest>
         <login>agre-a</login>
      </ser:GetUserByLoginWSOperationRequest>
   </soapenv:Body>
</soapenv:Envelope>
```

```xml
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ser="http://www.talend.org/service/">
   <soapenv:Header/>
   <soapenv:Body>
      <ser:GetUserWSOperationRequest>
         <id>4</id>
      </ser:GetUserWSOperationRequest>
   </soapenv:Body>
</soapenv:Envelope>
```
