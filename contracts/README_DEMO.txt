- deploy MyToken, get deployment address MY_TOKEN_ADDRESS
- DEPLOY SmartGridService using OWNER account, pass MY_TOKEN_ADDRESS to constructor, get deployment address SMART_GRID_SERVICE_ADDRESS
- in MyToken; make sure both OWNER and SUBSRIBER_ADDRESS have large balance; > 1000_000_1000
; from SUBSRIBER_ADDRESS and OWNER_ADDRESS both allow(SMART_GRID_SERVICE_ADDRESS, 1000_000)

push api call to firefly to call SMART_GRID_SERVICE_ADDRESS from owner account; 
reportUsage(SUBSRIBER_ADDRESS, -100, 1)
reportUsage(SUBSRIBER_ADDRESS, 200, 1)
reportUsage(SUBSRIBER_ADDRESS, 2000, 1)
