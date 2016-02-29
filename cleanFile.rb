# coding: utf-8

whiteList = Array.new();

def thinner(dirPath)
    filePaths = Dir.glob("dirPath" + "/**/{*.h,*.m}");
    puts filePaths.count;

    allFilePaths = filePaths.dup;
    allFilePaths.each{ |filePath|
        thinnerByFiles(filePaths, filePath);
    }
    puts filePaths;
end

def thinnerByFiles(filePaths, curfilePath)
    curfileName = File.basename(curfilePath, ".*")
    curfile = File.open(curfilePath)
    curfile.each{ |line|
        filePaths.delete_if { |filePath|
            fileName = File.basename(filePath, ".*")
            if line.include? fileName && fileName != curfileName
                whiteList.push(filePath);
                return true;
            else
                return false;
            end
        }
    }
    file.close
end
