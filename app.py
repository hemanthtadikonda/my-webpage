from PIL import Image
import streamlit as st

st.set_page_config(page_title="My Webpage",page_icon=":tada:",layout="wide")

# ---- Load Assets ---
img_contact_from = Image.open("images/Hemanth.png")


## --- Header Section ---
with st.container():
    st.subheader("Hi, I am Hemanth Tadikonda :wave: ")
    st.title("A DevOps Engineer from HCL Tech :flag_inda: ")
    st.write(" I am a passionate DevOps Engineer with a keen interest in automating deployments and optimizing the software delivery pipeline.")
    st.write("[About HCL Tech >](https://en.wikipedia.org/wiki/HCLTech)")

## ---- About Me ---
with st.container():
    st.write("---")
    st.header("About Me")
    st.write("##")
    image_column,text_column = st.columns((1,2))
    with image_column:
        st.image(img_contact_from)
    with text_column:
        st.subheader("Professional Summary:")
        st.write(
            '''
            	Around 3 years of experience in IT industry with major focus on Configuration Management, Build & Release Management, Infrastructure Management and CI/CD automation. Worked as AWS and DevOps engineer in various dynamic environments.\n
            	Worked on Microservices architecture which includes diversified tech stack involved in them.\n
            	Good hands-on AWS services like EC2, EKS, S3, Secret Manager, IAM, ACM, VPC, RDS, ElasticCache, DocumentDB.\n
            	Experience in writing Multi environment Infrastructure code using Terraform.\n  
            	Experience working with version control systems like GIT and used Source code management tools GitHub.\n
            	Implemented a CI/CD pipeline involving GitHub, Jenkins, Ansible, and Terraform for complete automation from commit to deployment for Mutable and Immutable Infrastructures.\n
            	Good hands-on Jenkins pipelines with shared libraries.\n
            	Installed and Configured Nexus Repositories.\n 
            	Implemented SAST practices using SonarQube.\n
            	Installed and configured Ansible and created Ansible Playbooks for deployments and patch management.\n
            	Extensively used configuration management tool with Ansible Roles.\n
            	Hands-on experience using Maven, NodeJS, Python & GoLang as the build tool for building of deployable artifacts from source code.\n
            	Strong experience with monitoring tools such as Prometheus & Grafana.\n
            	Experience in Log aggregation with ELK.\n
            	Hands-on experience creating container images with Dockerfiles.\n
            	Good understanding of Kubernetes in managing Docker containers.\n
            '''
        )
        st.write("[Learn docker >](https://github.com/hemanthtadikonda/learn-docker.git)")


## ---- what i do ----

with st.container():
    st.write("---")
    left_column, right_column = st.columns(2)
    with left_column:
        st.header("What I Do")
        st.write("##")
        st.write(
            '''
            Continuous Integration and Continuous Deployment (CI/CD):\n
            Infrastructure as Code (IaC):\n
            Configuration Management:\n
            Monitoring and Logging:\n
            Containerization and Orchestration:\n
           '''
        )
    with right_column:
        st.write("##")
        st.write("##")
        st.write("[ To Know More >](https://github.com/hemanthtadikonda/rb-jenkins)")
        st.write("[ To Know More >](https://github.com/hemanthtadikonda/rb-terraform)")
        st.write("[ To Know More >](https://github.com/hemanthtadikonda/rb-ansible)")
        st.write("[ To Know More >](https://github.com/hemanthtadikonda/rb-ansible/tree/main/roles/elk)")
        st.write("[ To Know More >](https://github.com/hemanthtadikonda/learn-docker)")
        st.write("[ To Know More >](https://github.com/hemanthtadikonda/learn-helm)")


# #---  Projects ----
# with st.container():
#     st.write("---")
#     st.header("My Projects")
#     st.write("##")
#     image_column,text_column = st.columns((1,2))
#     with image_column:
#         st.image(img_contact_from)
#     with text_column:
#         st.subheader("Containerization")
#         st.write(
#             '''
#             The Projects which i make through Containerization
#             you can search in hub.docker.com with user "hemanthtadikonda"
#             '''
#         )
#         st.write("[Learn docker >](https://github.com/hemanthtadikonda/learn-docker.git)")