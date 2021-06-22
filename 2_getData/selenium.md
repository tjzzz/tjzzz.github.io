# 【package】selenium

安装

```
pip install selenium
```


简单入门demo https://selenium-python-zh.readthedocs.io/en/latest/getting-started.html


一个hello word的简单示例，下面会对代码做具体解释。

```
from selenium import webdriver
from selenium.webdriver.common.keys import Keys

driver = webdriver.Firefox()
driver.get("http://www.python.org")
assert "Python" in driver.title
elem = driver.find_element_by_name("q")
elem.clear()
elem.send_keys("pycon")
elem.send_keys(Keys.RETURN)
assert "No results found." not in driver.page_source
driver.close()

```


个人使用
如果不知道路径在哪，可以通过检查的方式，copy出来元素的路径
![-w1129](media/15637037730857/15733742110561.jpg)




抓取代码

```
year = sys.argv[1]
page_num = 10   # 随便初始化一个翻页次数
	
page = 1
driver = webdriver.Chrome('./chromedriver')
user_name = 'xxx'
password = 'xxx'

while page <= page_num:
	if page == 1:
		url = 'https://www.patexplorer.com/results/s.html?sc=7&q=lse%3A%28%E6%9D%83%E5%88%A9%E8%BD%AC%E7%A7%BB%29+++AND+%28ad%3A%5B' + year + '+TO+' + year + '%5D%29&fq=&type=s&sort=&sortField=#/10/' + str(page)
		driver.get(url)    # 打开网页
		                                          
		# 1. 先把显示改为100条一页
		time.sleep(5)
		# 登陆
		driver.find_element_by_class_name('Js_login').click()
		time.sleep(5)
		driver.find_element_by_xpath('/html/body/div[8]/div/div[2]/div[1]/div[1]/form/div[1]/input').send_keys(user_name)
		driver.find_element_by_xpath('/html/body/div[8]/div/div[2]/div[1]/div[1]/form/div[2]/input').send_keys(password)
		driver.find_element_by_class_name('JS_accountLoginBtn').click()

		time.sleep(180)

		print '登陆完毕，准备开始start '
		driver.find_element_by_class_name('btui-select-view').click()     # 找到筛选框
		driver.find_element_by_xpath('//*[@id="paging"]/div/div/div/ul/li[5]').click()   #点击第5个的筛选即100
		time.sleep(30)
		zz = driver.find_element_by_class_name('btui-paging-totalPage')    # 找到一共多少页
		num = filter(str.isdigit, zz.text.encode('utf8'))
		page_num = int(num)
	
	#  当前激活的页码
	if page > 1:    # 翻页后的时间
		time.sleep(30)
	tmp = driver.find_element_by_class_name('paging-active')
	now_page = int(tmp.text)
	print 'now_page = ' + str(now_page) + ', page=' + str(page)
	
	while now_page < page:   ### 还没加载完
		try:
			tmp = driver.find_element_by_class_name('paging-active')
			now_page = int(tmp.text)
			print 'now_page = ' + str(now_page) + ', page=' + str(page)
		except:
			now_page = page
		time.sleep(10)
		print 'wating....'

	out_id = year + '_' + str(page)


	soup = bs4.BeautifulSoup(driver.page_source, "html.parser")        # 获取页面内容
	save_page(soup, out_id)

	 # 找到下一页的按钮
	driver.find_element_by_class_name("paging-next").click()   #注意：class_name中不能有空格！！所以只写部分也行只要是唯一即可
	
	page += 1

driver.close()
```


