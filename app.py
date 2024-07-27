import requests
import streamlit as st
from streamlit_lottie import st_lottie


st.set_page_config(page_title="My Webpage",page_icon=":tada:",layout="wide")

def load_lottieurl(url):
    r = requests.get(url)
    if r.status_code != 200:
        return None
    return r.mp4()

# --- Load Assets---

lottie_coding = "https://cdnl.iconscout.com/lottie/premium/thumb/professional-male-devops-8872610-7233289.mp4"

## --- Header Section ---

with st.container():
    st.subheader("Hi, I am Hemanth :wave: ")
    st.title("A DevOps Engineer from HCL Tech")
    st.write(" I am passinate about automate deployments ")
    st.write("[Laern More >](https://github.com/hemanthtadikonda)")

## ---- what i do ----

with st.container():
    st.write("---")
    left_column,right_column = st.columns(2)
    with left_coulmn:
        st.header("What i do")
        st.write("##")
        st.write(
            '''
            Continuous Integration and Continuous Deployment (CI/CD):
            Infrastructure as Code (IaC):
            Configuration Management:
            Monitoring and Logging:
            Containerization and Orchestration:
            '''
        )
        st.write("[Know More >](https://github.com/hemanthtadikonda)")
    with right_column:
        st_lottie(lottie_coding, height=300, key="coding")
