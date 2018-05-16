public abstract class Pizza{
	String name;
	String dough;
	String sauce;
	ArrayList toppings= new ArrayList();
	void prepare(){
		System.out.println("Preparing"+name);
		System.out.println("Tossing dough...");
		System.out.println("Adding sauce");
		System.out.println("Adding toppings");
		for(int i=0; i<toppings.size(); i++){
			System.out.print("  "+toppings.get(i));
		}
	}
	void bake(){
		System.out.println("bake for 25 minutes at 350");
	}
	void cut(){
		System.out.println("cutting the pizza");
	}
	void box(){
		System.out.println("place the pizza in the store");
	}
	public String getName(){
		return name;
	}
	public String toString(){
		StringBuffer display= new StringBuffer();
		display.append("---"+ name+ "---");
        display.append(dough+"/n");
        display.append(sauce+"/n");
        for(int i=0;i<toppings.size();i++){
        	display.append((String)toppings.get(i)+"/n");
        }
        return display.toString();
	}
}