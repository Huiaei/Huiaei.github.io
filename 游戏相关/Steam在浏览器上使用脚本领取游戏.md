# Steam 在浏览器上使用脚本领取游戏

### 单独激活

1. 首先登录网页版Steam 账号。 [https://store.steampowered.com/](https://store.steampowered.com/)
2. 点击右上角自己账号 ----账户明细 ----许可和产品序列号激活
3. 获取需要的游戏ID，可前往[SteamDB](https://steamdb.info)查询
4. `F12`打开控制台
5. 输入AddFreeLicense(`游戏ID`);

### 批量激活

1. 首先登录网页版Steam 账号。 [https://store.steampowered.com/](https://store.steampowered.com/)
2. 点击右上角自己账号 ----账户明细 ----许可和产品序列号激活
3. 获取需要的游戏ID，可前往[SteamDB](https://steamdb.info)查询
4. `F12`打开控制台
5. 右键粘贴代码，在注释下方添加需要添加游戏的游戏ID，之后回车。

添加位置如下

```javascript
    var freePackages =
	[
		//格式：请在下面输入游戏id。
        //游戏id,
        //游戏id,
        //...,
        -->在这里添加游戏ID，每行结束以`,`结尾。<--
        -->不要把直接把ID粘贴在这，需要粘贴在下方完整代码对应位置中<--
	];
```

完整代码如下

```
(function()
{
    if( location.href.match( /^https:\/\/store\.steampowered\.com\/account\/licenses\/?$/ ) === null )
	{
		alert( '请在Steam帐号明细页面运行这些代码: https://store.steampowered.com/account/licenses/' );

		window.location = 'https://store.steampowered.com/account/licenses/';

		return;
	}
	
	var freePackages =
	[
		//格式：请在下面输入游戏id。
        //游戏id,
        //游戏id,
        //...,
	];
	
	var ownedPackages = {};
	
	jQuery( '.account_table a' ).each( function( i, el )
	{
		var match = el.href.match( /javascript:RemoveFreeLicense\( ([0-9]+), '/ );
		
		if( match !== null )
		{
			ownedPackages[ +match[ 1 ] ] = true;
		}
	} );
	
	var i = 0,
	    loaded = 0,
	    package = 0,
	    total = freePackages.length,
	    modal = ShowBlockingWaitDialog( '努力执行中...',
	    	'请耐心等待，如果有错误请无视，请耐心等待脚本加载完毕' );
	
	for( ; i < total; i++ )
	{
		package = freePackages[ i ];
		
		if( ownedPackages[ package ] )
		{
			loaded++;
			continue;
		}
		
		jQuery.post(
			'//store.steampowered.com/checkout/addfreelicense',
			{
				action: 'add_to_cart',
				sessionid: g_sessionID,
				subid: package
			}
		).always( function( )
			{
				loaded++;
				
				modal.Dismiss();
				
				if( loaded >= total )
				{
					location.reload();
				}
				else
				{
					modal = ShowBlockingWaitDialog( '执行中...',
						'加载至 <b>' + loaded + '</b>/' + total + '.' );
				}
			}
		);
	}
}());
```
