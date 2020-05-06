### 1. Check info url
```
curl "http://0.0.0.0:8091/info"
```
**Result: info about app should be in response**

### 2. POST /bear - create with full  data 
```
curl -X "POST" "http://0.0.0.0:8091/bear" \
     -H 'Content-Type: application/json; charset=utf-8' \
     -d $'{
  "bear_type": "BLACK",
  "bear_name": "mikhail",
  "bear_age": 17.5
}'
```
**Result: bear is created**

### 3. POST /bear - create without bear_type
```
curl -X "POST" "http://0.0.0.0:8091/bear" \
     -H 'Content-Type: application/json; charset=utf-8' \
     -d $'{
  "bear_name": "mikhail",
  "bear_age": 17.5
}'
```
**Result: Error. Pls fill all parameters**

### 4. POST /bear - create without bear_name
```
curl -X "POST" "http://0.0.0.0:8091/bear" \
     -H 'Content-Type: application/json; charset=utf-8' \
     -d $'{
  "bear_type": "BLACK",
  "bear_age": 17.5
}'
```
**Result: Error. Pls fill all parameters**

### 5. POST /bear - create without bear_age
```
curl -X "POST" "http://0.0.0.0:8091/bear" \
     -H 'Content-Type: application/json; charset=utf-8' \
     -d $'{
  "bear_type": "BLACK",
  "bear_name": "mikhail"
}'
```
**Result: Error. Pls fill all parameters**

### 6. POST /bear - create with null parameters
```
curl -X "POST" "http://0.0.0.0:8091/bear" \
     -H 'Content-Type: application/json; charset=utf-8' \
     -d $'{}'
```
**Result: Error. Pls fill all parameters**

### 7. POST /bear - create with incorrect bear_type
```
curl -X "POST" "http://0.0.0.0:8091/bear" \
     -H 'Content-Type: application/json; charset=utf-8' \
     -d $'{
  "bear_type": "1",
  "bear_name": "mikhail",
  "bear_age": 17.5
}'
```
**Result: bear could not be created**

### 8. POST /bear - create with incorrect bear_name
```
curl -X "POST" "http://0.0.0.0:8091/bear" \
     -H 'Content-Type: application/json; charset=utf-8' \
     -d $'{
  "bear_type": "BLACK",
  "bear_name": "1111",
  "bear_age": 17.5
}'
```
**Result: bear could not be created. Name should be alphabetical**

### 9. POST /bear - create with incorrect bear_age
```
curl -X "POST" "http://0.0.0.0:8091/bear" \
     -H 'Content-Type: text/plain; charset=utf-8' \
     -d $'{
  "bear_type": "BLACK",
  "bear_name": "Mike",
  "bear_age": "f"
}'
```
**Result: bear could not be created. Age should be numerical**

### 10. POST /bear - create with full data and type POLAR 
```
curl -X "POST" "http://0.0.0.0:8091/bear" \
     -H 'Content-Type: application/json; charset=utf-8' \
     -d $'{
  "bear_type": "POLAR",
  "bear_name": "mikhail",
  "bear_age": 17.5
}'
```
**Result: bear is created**

### 11. POST /bear - create with full data and type BROWN 
```
curl -X "POST" "http://0.0.0.0:8091/bear" \
     -H 'Content-Type: application/json; charset=utf-8' \
     -d $'{
  "bear_type": "BROWN",
  "bear_name": "mikhail",
  "bear_age": 17.5
}'
```
**Result: bear is created**

### 12. POST /bear - create with full data and type GUMMY 
```
curl -X "POST" "http://0.0.0.0:8091/bear" \
     -H 'Content-Type: application/json; charset=utf-8' \
     -d $'{
  "bear_type": "GUMMY",
  "bear_name": "mikhail",
  "bear_age": 17.5
}'
```
**Result: bear is created**

### 13. Get /bear - read all bears (bears are exist)
```
curl "http://0.0.0.0:8091/bear"
```
**Result: list with bears should present**

### 14. Get /bear - read all bears (bears aren't exist)
```
curl "http://0.0.0.0:8091/bear"
```
**Result: list with bears should present**

### 15. GET /bear/:id - read specific bear  (bear is exist)
```
curl "http://0.0.0.0:8091/bear/1" 
```
**Result: bear with parameters**

### 16. GET /bear/:id - read specific bear  (bear_id is not  exist)
```
curl "http://0.0.0.0:8091/bear/100000" 
```
**Result: Empty**

### 17. PUT /bear/:id - update specific bear with correct parameters 
Bear with parameters {"bear_id":1,"bear_type":"BLACK","bear_name":"Mike","bear_age":17.5} is exist
```
curl -X "PUT" "http://0.0.0.0:8091/bear/1" \
     -H 'Content-Type: application/json; charset=utf-8' \
     -d $'{
  "bear_type": "BROWN",
  "bear_name": "Nike",
  "bear_age": 10
}'
```
**Result: Bear is updated**


### 18. PUT /bear/:id - update specific bear with null parameters 
Bear with parameters {"bear_id":1,"bear_type":"BLACK","bear_name":"Mike","bear_age":17.5} is exist
```
curl -X "PUT" "http://0.0.0.0:8091/bear/1" \
     -H 'Content-Type: application/json; charset=utf-8' \
     -d $'{
  "bear_type": "",
  "bear_name": "",
  "bear_age": null
}'
```
**Result: Bear is not updated**

### 19. PUT /bear/:id - update specific bear with empty bear_type  
Bear with parameters {"bear_id":1,"bear_type":"BLACK","bear_name":"Mike","bear_age":17.5} is exist
```
curl -X "PUT" "http://0.0.0.0:8091/bear/1" \
     -H 'Content-Type: application/json; charset=utf-8' \
     -d $'{
  "bear_type": "",
  "bear_name": "Mike",
  "bear_age": 7
}'
```
**Result: Bear is not updated**

### 20. PUT /bear/:id - update specific bear with incorrect bear_type  
Bear with parameters {"bear_id":1,"bear_type":"BLACK","bear_name":"Mike","bear_age":17.5} is exist
```
curl -X "PUT" "http://0.0.0.0:8091/bear/1" \
     -H 'Content-Type: application/json; charset=utf-8' \
     -d $'{
  "bear_type": "test",
  "bear_name": "Mike",
  "bear_age": 7
}'
```
**Result: Bear is not updated**

### 21. PUT /bear/:id - update specific bear with empty bear_name  
Bear with parameters {"bear_id":1,"bear_type":"BLACK","bear_name":"Mike","bear_age":17.5} is exist
```
curl -X "PUT" "http://0.0.0.0:8091/bear/1" \
     -H 'Content-Type: application/json; charset=utf-8' \
     -d $'{
  "bear_type": "Black",
  "bear_name": "",
  "bear_age": 7
}'
```
**Result: Bear is not updated**

### 22. PUT /bear/:id - update specific bear with null bear_age  
Bear with parameters {"bear_id":1,"bear_type":"BLACK","bear_name":"Mike","bear_age":17.5} is exist
```
curl -X "PUT" "http://0.0.0.0:8091/bear/1" \
     -H 'Content-Type: application/json; charset=utf-8' \
     -d $'{
  "bear_type": "BLACK",
  "bear_name": "Mike",
  "bear_age": null
}'
```
**Result: Bear is not updated**

23. PUT /bear/:id - update specific bear with null bear_age  
Bear with parameters {"bear_id":1,"bear_type":"BLACK","bear_name":"Mike","bear_age":17.5} is exist
```
curl -X "PUT" "http://0.0.0.0:8091/bear/1" \
     -H 'Content-Type: application/json; charset=utf-8' \
     -d $'{
  "bear_type": "BLACK",
  "bear_name": "Mike",
  "bear_age": null
}'
```
**Result: Bear is not updated**


24. PUT /bear/:id - update specific bear with boolean bear_age  
Bear with parameters {"bear_id":1,"bear_type":"BLACK","bear_name":"Mike","bear_age":17.5} is exist
```
curl -X "PUT" "http://0.0.0.0:8091/bear/1" \
     -H 'Content-Type: application/json; charset=utf-8' \
     -d $'{
  "bear_type": "BLACK",
  "bear_name": "Mike",
  "bear_age": true
}'
```
**Result: Bear is not updated**

25. Delete /bear - delete all bears (bears are exist)

```
curl "http://0.0.0.0:8091/bear"
```
**Result: Bears are deleted**


26. Delete /bear - delete all bears (bears aren't exist)

```
curl "http://0.0.0.0:8091/bear"
```
**Result: nothing happens**

27. Delete /bear/id  -- delete specific bear 
Bear with parameters {"bear_id":1,"bear_type":"BLACK","bear_name":"Mike","bear_age":17.5} is exist
```
curl -X "DELETE" "http://0.0.0.0:8091/bear/1"
```
**Result: Bear was deleted**

28. Delete /bear/id  -- delete specific bear 
Bear with id is not exist
```
curl -X "DELETE" "http://0.0.0.0:8091/bear/1"
```
**Result: nothing happens**