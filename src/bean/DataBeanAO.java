package bean;
import java.sql.Time;
import java.sql.Date;
public class DataBeanAO {

		

			private String  source, destination, flight_type, status, code, place, flight_no;  
			private int id;
			private Time arrival, departure;
			private Date arrival_date, departure_date;
			
			public int getId()
			{
				return id;
			}
			public void setId(int id)
			{
				this.id = id;
			}
			public String getFlightNo() {  
			    return flight_no;  
			}  
			  
			public void setFlightNo(String flight_no) {  
			    this.flight_no = flight_no;  
			}  
			  
			public Time getArrival() {  
			    return arrival;  
			} 
			public void setDepartDate(Date departure_date)
			{
				this.departure_date = departure_date;
			}
			public Date getDepartDate()
			{
				return departure_date;
			}
			public void setArrival_date(Date arrival_date)
			{
				this.arrival_date= arrival_date;
			}
			public Date getArrival_date()
			{
				return arrival_date;
			}
			  
			public void setArrival(Time arrival) {  
			    if(arrival!=null)this.arrival = arrival;  
			}  
			public Time getDeparture() {  
			    return departure;  
			}  
			  
			public void setDeparture(Time departure) {  
			    if(departure!=null)this.departure = departure;  
			}  

			public String getSource()
			{
				return source;
			}
			public void setSource(String source)
			{
				if(source!=null)
				this.source = source;
			}
			 
			public String getDestination()
			{
				return destination;
			}
			public void setDestination(String destination)
			{
				if(destination!=null)
				this.destination = destination;
			}
			
			public String getType()
			{
				return flight_type;
			}
			public void setType(String flight_type)
			{
				if(flight_type!=null)
				this.flight_type = flight_type;
			}
			public void setStatus(String status)
			{
				
				this.status = status;
			}
			public String getStatus()
			{
				return status;
			}
			public String getCode()
			{
				return code;
			}
			public void setCode(String code)
			{
				this.code = code;
			}
			public void setPlace(String place)
			{
				this.place = place;
			}
			public String getPlace()
			{
				return place;
			}
			



	}



