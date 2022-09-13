
#%%
from pyzotero import zotero
zot = zotero.Zotero("7719187", "user", "zmChTwz5o2r0sPltHPiQZyNY")

import pandas as pd
import requests
import random
import json
from hashlib import md5

#%%
items = zot.top(limit=5)
#%%
# we've retrieved the latest five top-level items in our library
# we can print each item's item type and ID
for item in items:
    print('Item: %s | Key: %s' % (item['data']['itemType'], item['data']['key']))


# %%百度翻译设置
appid = "20220504001202634" #自己申请appid
appkey = "77lGXuBEdh_h44uwyXDr" # 自己申请的 key

# 调用百度翻译 API
def make_md5(s, encoding='utf-8'):
    """
    生成随机数和签名
    """
    return md5(s.encode(encoding)).hexdigest()

def translate(query, from_lang, to_lang):
    """
    调用百度翻译 API
    """
    url = 'http://api.fanyi.baidu.com/api/trans/vip/translate'
    salt = random.randint(1, 65536) #随机数
    sign = make_md5(appid + query + str(salt) + appkey)    # 构造请求
    headers = {'Content-Type': 'application/x-www-form-urlencoded'}
    payload = {'appid': appid,'q': query,'from': from_lang, 'to': to_lang, 'salt': salt,'sign': sign}
    r = requests.post(url, params=payload, headers=headers)
    text = r.json()
    result = text['trans_result'][0]['dst']
    return result
#%%Zotero 获取摘要

# Zotero 账户

library_id = '' # https://www.zotero.org/settings/keyslibrary_type = 'user' # 'user' or 'group'
api_key = '' #  not be accessible again after created.zot = zotero.Zotero(library_id, library_type, api_key)
colls = zot.collections() # 所有集合名称# 查找待分析的集合
for coll in colls:    
	if coll['data']['name'] == 'Environment':
        print(coll)pyz = zot.collection_items('9FLNCCHU') # 待分析集合的 key


# 存储标题、摘要和作者


title = []
abstract = []
author = []
for p in pyz:    
	if p['data']['itemType'] == "journalArticle":       
		title.append(p['data']['title'])        
		abstract.append(p['data']['abstractNote'])        
		author.append(p['data']['creators'][0]['lastName'])

# 摘要翻译成中文
abstract_cn = []
for ab in abstract:    
	if ab != "":        
abstract_cn.append(translate(ab,"en","zh"))    else:        
		abstract_cn.append("")

# 写入 DataFrame


paper_info = {    "title": title,    "author": author,    "abstract": abstract,    "abstract_cn":abstract_cn}
df = pd.DataFrame(paper_info)# 导出为 Excel
df.to_excel("Environment_References_Abstract_CN.xlsx", index=None)
