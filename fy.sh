#!/bin/bash

# Terminal translate
# by Rick
# 2017-12-13

DIC_FILE='res/NCCE.English.Chinese.Technology.Dictionary.txt'

TEXT=$1

if test $# -ne 1
then
    echo "Usage  : ./fy.sh <text>"
    echo "Example: ./fy.sh international"
    exit 0
fi

RESULT=`grep "^${TEXT} =" ${DIC_FILE}`

function displayresult()
{
    line=$1
    word="`echo \"${line}\"|awk -F" = " '{print $1}'`"
    symb="`echo \"${line}\"|sed "s/.*\[/\[/g;s/\].*/\]/g"`"

    if test "`echo ${line}|awk -F" = " '{print substr($2,1,1)}'`" = "["
    then
        echo "    ${word} ${symb}"
        echo ""
        echo "    `echo ${line}|awk -F"]" '{print $2}'`"
        echo ""
        echo "    ==========================="
        echo "    You may also need:"
        r_str=""
        for (( i=0;i<7;i++ ))
        do
            random=$(( (RANDOM%`grep ".* ${TEXT} .*=" ${DIC_FILE} | wc -l`) + 1 ))
            export random
            s_str=`grep ".* ${TEXT} .*=" ${DIC_FILE} | awk -F" = " '{if(FNR==ENVIRON["random"]) print $1}'`
            if test "${r_str}" == ""
            then
                r_str="${s_str}"
            else
                r_str="${r_str}, ${s_str}"
            fi
        done
        echo "    ${r_str} ..."
        echo ""
    else
        echo "    ${word}"
        echo ""
        echo "    `echo ${line}|awk -F" = " '{print $2}'`"
        echo ""
    fi    
}

if test "${RESULT}" = "" 
then
    echo ""
    echo "    No result to display..."
    echo ""
    exit 0
else
    echo ""
    displayresult "${RESULT}"
fi


