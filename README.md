# todo


## メモ
https://www.creationline.com/tech-blog/57657  
https://www.creationline.com/tech-blog/56353  
MongoAtlasでは全文検索が可能とのこと
素直にElastic Searchでもいい気がするけどなぁ

https://groups.google.com/g/mongodb-jp/c/LV9naEb-iww?pli=1  


## 部分一致検索は、Goで形態素解析した文字列をfieldにlistとして入れて検索するようにする

MongoDBで日本語の部分一致検索をしたいのですが
この場合、プログラムで文章を形態素解析して、MongoDBに文字列のリスト `[]string` として格納、そのfieldに通常のindexを貼って検索すれば、indexを利用したMongoDBでの部分一致検索が可能  

## TODO 
cloudflare kv access repository  
https://developers.cloudflare.com/api/operations/workers-kv-namespace-read-key-value-pair