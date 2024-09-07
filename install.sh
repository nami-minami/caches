case `uname -s` in 
        Darwin)
                files=()
                for file in .*
                do
                        if [[ $file != '.' && $file != ".." && $file != ".git" &&  $file != "install.sh" ]]
                        then
                                files+=($file)
                        fi
                done
                ;;

        Linux)
                files=()
                for file in .*
                do
                        if [[ $file != '.' && $file != ".." && $file != ".git" &&  $file != "install.sh" && $file != ".config/iterm2" && $file != ".matplotlib" ]]
                        then
                                files+=($file)
                        fi
                done
                ;;
esac

echo ${files[@]}

while true
do
        read -p "Are you sure you want to create symbolic links for the above files in the home directory? [y/N]:" answer

        case "$answer" in 
                [yY]*)
                        for file in "${files[@]}"
                        do
                                ln -snfv $PWD/$file $HOME
                        done
                        break
                        ;;

                [nN]*)
                        break
                        ;;

                *)
                        continue
                        ;;      
        esac
done
