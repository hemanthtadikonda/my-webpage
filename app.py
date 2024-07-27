import streamlit as st


st.set_page_config(page_title="My Webpage",page_icon=":tada:",layout="wide")

## --- Header Section ---

with st.container():
    st.subheader("Hi, I am Hemanth :wave: ")
    st.title("A DevOps Engineer from HCL Tech")
    st.write(" I am passinate about automate deployments ")
    st.write("[Laern More >](https://github.com/hemanthtadikonda)")

## ---- what i do ----

with st.container():
    st.write("---")
    left_colum,right_colum = st.colum (2)

    with left_coulm:
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
