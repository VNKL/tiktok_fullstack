FROM python:3


WORKDIR usr/src/api

ARG git_personal_token
RUN git config --global url."https://${git_personal_token}:@github.com/".insteadOf "https://github.com/"
RUN git clone https://github.com/VNKL/tiktok_api.git .

RUN pip install -r requirements.txt

COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]