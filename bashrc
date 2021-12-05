cd $(dirname $0)
PATH=/home/test:$PATH
echo "source /home/test/bashsrc" >> /root/.bashrc
bash
