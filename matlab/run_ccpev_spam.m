N = 5000; % count of images
QF = 95;

fin = fopen('Dataset_tune_train.txt', 'r');
fout1 = fopen('outfile1.txt', 'w');

for i = 1:N
    image_name = fgets(fin);
    filename = strcat('..\mirflickr\im', image_name, '.jpg');
    
    %ccpev features   
    try
        data_ccpev = ccpev548(filename, QF);
        ccpev_save_to = strcat('result_ccpev\', image_name, '.txt');
        dlmwrite(ccpev_save_to, data_ccpev);
    catch
        fprintf(fout1, '%s', filename);
    end
    
    %spam features
    data_spam = spam686(filename);
    spam_save_to = strcat('result_spam\', image_name, '.txt');
    dlmwrite(spam_save_to, data_spam);
end

fclose(fin);
