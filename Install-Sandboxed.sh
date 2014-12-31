#! /bin/sh

export project_name="EvenBetterAuthorizationSample"
export app_name="${project_name}"
export app_info="App-Sandboxed/App-Sandboxed-Info.plist"
export app_signed="./build/Release/${app_name}.app"

export helper_name="HelperTool"
export identifier="com.example.apple-samplecode.EBAS"
export helper_info="${helper_name}/${helper_name}-Info.plist"

export smjobblessutil="./SMJobBlessUtil.py"


build() 
{

    xcodebuild clean -project $project_name.xcodeproj > /dev/null && xcodebuild -project $project_name.xcodeproj > /dev/null

}

sign()
{

    /usr/bin/env python $smjobblessutil setreq $app_signed $app_info $helper_info  

}

check()
{
    /usr/bin/env python $smjobblessutil check $app_signed 
}


build && sign && build && check 
