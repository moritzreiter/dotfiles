function repair_kindle
  set content_path $HOME'/Library/Containers/com.amazon.Kindle/Data/Library/Application Support/Kindle/My Kindle Content'
  killall Kindle
  echo 'Delteing content of '$content_path
  touch $content_path/tmp # prevent error when directory is already empty
  rm -rf $content_path/*
end

