FROM jupyter/scipy-notebook

COPY ./src ./src

RUN pip install pandas
RUN pip install pyarrow
RUN pip install scikit-plot
RUN pip install xgboost