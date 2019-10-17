addEventHandler ( "onPlayerLogin", getRootElement( ),
	function ( _, account )
		local playerSkin = getAccountData ( account, "cmn.skin" )
		if playerSkin then
			setElementModel ( source, playerSkin )
		end

		local posX = getAccountData ( account, "cmn.posX" )
		local posY = getAccountData ( account, "cmn.posY" )
		local posZ = getAccountData ( account, "cmn.posZ" )
		if posX and posY and posZ then
			setElementPosition ( source, posX, posY, posZ+0.5 )  
		end
	end
)

addEventHandler ( "onPlayerQuit", getRootElement( ),
	function (  )
		local account = getPlayerAccount ( source )
		if account then
			local skin = getElementModel ( source )
			setAccountData ( account, "cmn.skin", skin )

			local posX, posY, posZ = getElementPosition ( source )
			setAccountData ( account, "cmn.posX", posX )
			setAccountData ( account, "cmn.posY", posY )
			setAccountData ( account, "cmn.posZ", posZ )
		end
	end
)

addEventHandler ( "onPlayerWasted", getRootElement( ),
	function (  )
		local skin = getElementModel ( source )
		setElementData ( source, "skin", skin )
	end
)

addEventHandler ( "onPlayerSpawn", getRootElement( ),
	function (  )
		local skin = getElementData ( source, "skin" )
		if ( skin ) then
			setElementModel ( source, skin )
		end
	end
)